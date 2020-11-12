class FeedbacksController < ApplicationController

  def create 
    current_user.feedbacks.create(feedback_params)
  end

  private 

    def feedback_params
      params.require(:feedback).permit(:describe, :image)
    end

end