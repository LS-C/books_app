class HomeController < ApplicationController
    before_action :authenticate_client!

    def index
        @current_user = current_author || current_publishing_company
    end


end
