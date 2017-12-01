class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |author_params|
        author_params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
      end
    end

    private
    def authenticate_client!
        if current_author
            authenticate_author!
        else
         authenticate_publishing_company!
        end
    end






end
