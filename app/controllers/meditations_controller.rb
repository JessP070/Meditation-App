class MeditationsController < ApplicationController
    def new
        @meditation = Meditation.new
        @meditation.build_technique
    end

    def create 
        @meditation = Meditation.new(meditation_params)
        @meditation.user_id = session[:user_id]
        if @meditation.save
            redirect_to meditation_path(@meditation)
        else 
            render :new
        end
    end

    private

    def meditation_params
        params.require(:meditation).permit(:mood, :duration, :technique_id, technique_attributes: [:name, :description])
    end

end
