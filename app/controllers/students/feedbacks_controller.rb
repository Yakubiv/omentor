class Students::FeedbacksController < ApplicationController

    def create 
      @feedback = current_user.feedbacks.create(feedback_params)
      respond_to do |format|
        format.js {}
      end
    end
  
    private 
  
      def feedback_params
        params.require(:feedback).permit(:describe, :image)
      end
  
  end