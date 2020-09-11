class ReviewsController < ApplicationController

    def index
        if params[:meditation_id] && @meditation = Meditation.find_by_id(params[:meditation_id])
            @reviews = @meditation.reviews.build
        else 
            @reviews = Review.all
        end
    end

    def new 
        @meditation = Meditation.find_by_id(params[:meditation_id])
        @review = @meditation.reviews.build
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else 
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end


    private
    
    def review_params
        params.require(:review).permit(:stars, :title, :content, :meditation_id, meditation_attributes: [:mood, :duration])
    end
end
