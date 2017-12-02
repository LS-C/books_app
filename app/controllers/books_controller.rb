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
        @interest = Interest.new
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


    private
    def book_params
        params.require(:book).permit(:title, :category, :description, :author_id)
    end



end
