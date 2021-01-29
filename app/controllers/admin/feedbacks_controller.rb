class Admin::FeedbacksController < Admin::BaseController
  before_action :set_feedback, only: [:show, :destroy]

  def index
    @pagy, @feedbacks = pagy(Feedback.all, items: 15)
  end

  def show
  end

  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to admin_feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

end