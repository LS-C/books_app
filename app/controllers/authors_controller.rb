class AuthorsController < ApplicationController
    before_action :authenticate_author!


    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
    end

    def create
        @author = Author.create(author_params)
    end


    private
    def author_params
        params.require(:author).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation )
    end



end
