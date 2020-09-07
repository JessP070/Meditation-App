class MeditationsController < ApplicationController
    def new
        @meditation = Meditation.new
        @meditation.build_technique
    end

    private

    def meditation_params
        params.require(:meditation.permit(:mood, :duration, :technique_id, technique_attributes[:name, :description])
    end
end
