class InterestsController < ApplicationController
    before_action :authenticate_client!

    def index
        @interest = Interest.all
        render json: @interest
    end

    def show
    end

    def new
    end

    def create
        @interest = Interest.create(interest_params)
    end

    private
    def interest_params
        params.require(:interest).permit(:publishing_company, :book_id)
    end

end
