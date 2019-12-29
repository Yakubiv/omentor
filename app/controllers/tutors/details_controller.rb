# frozen_string_literal: true

class Tutors::DetailsController < Tutors::BaseController
  def show
    @tutor_profile = current_user.build_tutor_profile
  end

  def update
    if current_user.update(current_tutor_params)
      after_successfull_update_redirection
    else
      render :show
    end
  end

  def pending
    user_redirection if tutor_signed_in?
  end

  private

  def current_tutor_params
    params.require(:tutor).permit(:avatar, :first_name, :last_name, :username,
                                  :birthday, :bio, :phone, :city, :country,
                                  :gender, :rate, :total_years_of_expirience)
  end

  def after_successfull_update_redirection
    if request.referrer.match?(/profile/)
      redirect_to tutors_profile_path, notice: t('details_controller.update.success')
    else
      redirect_to tutors_dashboard_path, notice: t('details_controller.update.success')
    end
  end

  def user_redirection
    if current_tutor.first_name.present?
      redirect_to tutors_dashboard_path
    else
      redirect_to tutors_details_path
    end
  end
end
