class BooksController < ApplicationController
    before_action :authenticate_client!

    def index
        @books = Book.all
        respond_to do |format|
            format.html {render :index}
            format.json {render json: @books}
        end
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end


    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params)
        render json: @book
    end

    def book_data
        book = Book.find(params[:id])
        render json: book
    end

    def update_interests(user)
      user_liked?(user) ? unlike(user) : like(user)
    end

  def likes_message(user)
    if !user_liked?(user)
      "<strong>#{self.interests.count} people</strong> like this image".html_safe
    else
      "<strong>You</strong> and <strong>#{self.interests.count - 1} other people</strong> like this image".html_safe
    end
  end

  def interest
    @book = Book.find(params[:id])
    @current_user = current_publishing_company
    @interest = @current_user.interests.create(book_id: @book.id, publishing_company_id: @current_user.id)
    render json: @interest

  end

  def heart_class(user)
    if user_interested?(user)
      "glyphicon glyphicon-heart red-heart"
    else
      "glyphicon glyphicon-heart grey-heart"
    end
  end

  private
  def user_interested?(user)
    self.interests.where(user: user).any?
  end


  def unlike(user)
    self.interests.find_by(user_id: user.id).destroy
  end

    def book_params
        params.require(:book).permit(:title, :category, :description, :author_id)
    end

    def interest_params
        params.require(:interest).permit(:book_id, :publishing_company_id)
    end



end
