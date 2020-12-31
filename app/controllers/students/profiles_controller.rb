class Students::ProfilesController < Students::BaseController
  def show
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