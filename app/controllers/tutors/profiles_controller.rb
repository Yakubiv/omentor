# frozen_string_literal: true

class Tutors::ProfilesController < Tutors::BaseController
  def show
    @tutor_profile = current_tutor_profile
    @pagy, @reviews = pagy(@tutor_profile.reviews, items: 5)
    @decorated_tutor_profile = TutorProfileDecorator.new(@tutor_profile)
  end

  def update
    @user = current_user
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      flash[:notice] = t('profiles_controller.update.success')
    else
      flash[:error] = t('profiles_controller.update.failed')
    end
    redirect_back(fallback_location: schedule_tutors_settings_path)
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end