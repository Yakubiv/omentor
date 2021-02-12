class Students::Tutors::ReviewsController < Students::BaseController
  before_action :set_tutor_profile, only: %i[new create]

  def new
    @review = Review.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @review = Review.create(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to students_my_tutor_path(@tutor_profile), notice: "Review was created" }
        format.js {}
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:stars, :description, :profile_id)
  end

  def set_tutor_profile
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
  end
end