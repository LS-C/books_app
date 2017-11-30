class AuthorsController < ApplicationController
    before_action :authenticate_author!


    def index
        @authors = Author.all
        @books = Book.all
    end

    def show
        @book = Book.new
        @author = Author.find(params[:id])
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @author }
        end
    end

    def create
        @author = Author.create(author_params)
    end


    private
    def author_params
        params.require(:author).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end



end
