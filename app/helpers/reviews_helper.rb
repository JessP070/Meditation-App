module ReviewsHelper
    def display_header(review)
        if params[:meditation_id]
            content_tag(:h1, "Add a Review for #{review.meditation.mood} -  #{review.meditation.technique.name}")
        else
          content_tag(:h1, "Create a review")
        end
    end
end
