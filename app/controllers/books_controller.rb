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
        @author = current_author
        respond_to do |format|
          format.html { render :show }
          format.json { render json: @book }
        end
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params)
        render json: @book
    end

    def edit
      @book = Book.find(params[:id])
      @author = current_author
    end

    def update
      @book = Book.find(params[:id])
      @book.update(book_params)
        render json: @book
    end

    def book_data
        @book = Book.find(params[:id])
        render json: @book
    end


    def interest
        @book = Book.find(params[:id])
        @book.update_interests(current_publishing_company)
        # redirect_to root_path
        respond_to do |format|
          format.json { render json: { heart_class: @book.heart_class(current_publishing_company), interests_message: @book.interests_message(current_publishing_company)}}
        end
    end




    private
    def book_params
        params.require(:book).permit(:title, :category, :description, :author_id)
    end

end
