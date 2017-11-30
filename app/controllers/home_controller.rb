class HomeController < ApplicationController
    before_action :authenticate_author!

    def index

    end

end
