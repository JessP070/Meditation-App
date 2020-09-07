class MeditationsController < ApplicationController
    def new
        @meditation = Meditation.new

    end
end
