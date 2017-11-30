class PublishingCompaniesController < ApplicationController
    before_action :authenticate_publishing_company!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |publishing_company|
        publishing_company.permit(:company_name, :username :email, :password, :password_confirmation)
      end
    end
end
