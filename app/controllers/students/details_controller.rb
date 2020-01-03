# frozen_string_literal: true

class Students::DetailsController < Students::BaseController
  layout 'application', only: :show

  def show
    @student_profile = current_user.student_profile || current_user.build_student_profile
  end

  def create
    @student_profile = current_user.create_student_profile(current_student_params)
    if @student_profile.save!
      after_successfull_update_redirection
    else
      render :show
    end
  end

  private

  def current_student_params
    params.require(:student_profile).permit(:avatar, :first_name, :last_name, :username,
                                            :birthday, :bio, :phone, :city, :country,
                                            :gender, :degree_type)
  end

  def after_successfull_update_redirection
    if request.referrer.match?(/profile/)
      redirect_to students_profile_path, notice: t('details_controller.update.success')
    else
      redirect_to students_dashboard_path, notice: t('details_controller.update.success')
    end
  end
end
