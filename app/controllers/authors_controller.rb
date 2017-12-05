class AuthorsController < ApplicationController
    before_action :authenticate_author!
    before_action :access_to_own_profile, only: [:show]


    def index
        @authors = Author.all
        @books = Book.all
    end

    def show
        @author = Author.find(params[:id])
        @books = @author.books
        @book = Book.new
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @author }
        end
    end

    def create
        @author = Author.create(author_params)
    end

    def book_data
        @author = Author.find(params[:id])
        render json: @author
    end


    private
    def author_params
        params.require(:author).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end

    def access_to_own_profile
      @author = Author.find(params[:id])

      if current_author != @author
        redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
      end
    end



end
