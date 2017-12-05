class PublishingCompaniesController < ApplicationController
    before_action :authenticate_publishing_company!
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :access_to_own_account, only: [:show]


    def show
        @publishing_company = PublishingCompany.find(params[:id])
        @books = Book.all
        @book = Book.find(params[:id])
        @interest = Interest.new
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @publishing_company }
        end

    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |publishing_company|
        publishing_company.permit(:company_name, :username, :email, :password, :password_confirmation)
      end
    end

    private
    def access_to_own_account
      @client = PublishingCompany.find(params[:id])

      if @client != current_publishing_company
        redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
      end
    end

end
