class BooksController < ApplicationController
    before_action :authenticate_author!

    def index
        @books = Book.all
        render json: @books
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

    private
    def book_params
        params.require(:book).permit(:title, :category, :description, :author_id)
    end


end
