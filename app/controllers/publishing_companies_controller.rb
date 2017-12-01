class PublishingCompaniesController < ApplicationController
    before_action :authenticate_publishing_company!
    before_action :configure_permitted_parameters, if: :devise_controller?


    def show
        @publishing_company = PublishingCompany.find(params[:id])
        @books = Book.all
    end




    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |publishing_company|
        publishing_company.permit(:company_name, :username, :email, :password, :password_confirmation)
      end
    end
end
