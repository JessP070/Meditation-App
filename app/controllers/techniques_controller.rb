class TechniquesController < ApplicationController
    def index
        @techniques = Technique.all
    end
    
    def new 
        @technique = Technique.new
    end


  


end
