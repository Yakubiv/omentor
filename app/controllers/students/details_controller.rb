# frozen_string_literal: true

class Students::DetailsController < Students::BaseController
  before_action :load_student_profile, only: %i[show photo bio]

  layout 'application', only: :show

  def show
  end

  def photo
  end

  def bio
  end

  def update
    current_user.student_profile.update(current_student_params)
    after_update_redirection
  end

  def create
    @student_profile = current_user.create_student_profile(current_student_params)
    if @student_profile.save!
      after_successfull_create_redirection
    else
      render :show
    end
  end

  private

  def load_student_profile
    @student_profile = current_user.student_profile || current_user.build_student_profile
  end

  def current_student_params
    params.require(:student_profile).permit(:avatar, :first_name, :last_name, :username,
                                            :birthday, :bio, :phone, :city, :country,
                                            :gender, :degree_type)
  end

  def after_update_redirection

    binding.pry

    if request.referrer.match?(/photo/)
      redirect_to bio_students_details_path
    elsif request.referrer.match?(/bio/)
      redirect_to students_dashboard_path
    end
  end

  def after_successfull_create_redirection
    if request.referrer.match?(/profile/)
      redirect_to students_profile_path, notice: t('details_controller.update.success')
    else
      redirect_to students_dashboard_path, notice: t('details_controller.update.success')
    end
  end
end
