class MeditationsController < ApplicationController

    before_action :set_meditation, only: [:edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

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
    
    def index
        binding.pry
        if params[:q]
            @meditations = Meditation.starts_with
        else
            @meditations = Meditation.order_by_rating.alpha
        end
    end

    def show
        @meditation = Meditation.find_by_id(params[:id])
    end

    def edit
        @meditation = Meditation.find_by_id(params[:id])
    end

    def update
        @meditation = Meditation.find(params[:id])
    
        if @meditation.update(meditation_params)
          redirect_to @meditation 
        else 
          render 'edit'
        end 
    end

    def destroy
        @meditation.destroy
        redirect_to meditations_path
    end

    private

    def set_meditation
        @meditation = Meditation.find_by_id(params[:id])
    end

    def meditation_params
        params.require(:meditation).permit(:mood, :duration, :technique_id, technique_attributes: [:name, :description])
    end

end
