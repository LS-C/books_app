class BooksController < ApplicationController
    before_action :authenticate_publishing_company!
end
