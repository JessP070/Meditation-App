class TechniquesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @techniques = Technique.all

    end
    
end
