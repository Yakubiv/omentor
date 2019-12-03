# frozen_string_literal: true

class Students::DetailsController < Students::BaseController
  skip_before_action :authenticate_student!, only: :pending

  layout 'login', only: :pending

  def show
  end

  def update
    if current_student.update(current_student_params)
      after_successfull_update_redirection
    else
      render :show
    end
  end

  def pending
    user_redirection if student_signed_in?
  end

  private

  def current_student_params
    params.require(:student).permit(:avatar, :first_name, :last_name, :username,
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

  def user_redirection
    if current_student.first_name.present?
      redirect_to students_dashboard_path
    else
      redirect_to students_details_path
    end
  end
end
