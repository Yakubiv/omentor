class Students::SettingsController < Students::BaseController
  def update
    if current_user.student_profile.update(current_student_params)
      flash[:notice] = t('profiles_controller.update.success')
    else
      flash[:error] = t('profiles_controller.update.failed')
    end
    redirect_back(fallback_location: general_students_settings_path)
  end

  def general; end

  def bio; end

  def photo; end

  private

  def current_student_params
    params.require(:student_profile).permit(:avatar, :first_name, :last_name, :username,
                                            :birthday, :bio, :phone, :city, :country_id, :time_zone,
                                            :gender, :degree_type, :short_bio, :time_zone)
  end
end