class InterestsController < ApplicationController
    before_action :authenticate_client!

    def index
        @interests = Interest.all
        render json: @interests
    end

    def show
    end

    def new
    end

    def create
        @interest = Interest.create(interest_params)
          render json: @interest 
    end

    private
    def interest_params
        params.require(:interest).permit(:publishing_company_id, :book_id)
    end

end
