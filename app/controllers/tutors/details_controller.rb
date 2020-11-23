# frozen_string_literal: true

class Tutors::DetailsController < Tutors::BaseController
  before_action :load_tutor_profile, only: %i[show photo bio video schedule]
  skip_before_action :varify_that_user_filled_his_details
  skip_before_action :inactive_tutors_details, only: :inactive

  layout 'login'

  def show; end

  def photo; end

  def bio; end

  def video; end

  def schedule; end

  def inactive; end

  def update
    save_tutor_prfile
    after_update_redirection
  end

  def create
    if save_tutor_prfile
      after_successfull_create_redirection
    else
      render :show
    end
  end

  private

  def save_tutor_prfile
    return true unless params[:tutor_profile]

    if current_user.tutor_profile
      current_user.tutor_profile.update(current_tutor_params)
    else
      @tutor_profile = current_user.create_tutor_profile(current_tutor_params)
      @tutor_profile.save!
    end
  end

  def load_tutor_profile
    @tutor_profile = current_user.tutor_profile || current_user.build_tutor_profile
    @tutor_profile.speaks.new unless @tutor_profile.speaks.any?
  end

  def current_tutor_params
    params.require(:tutor_profile).permit(:avatar, :first_name, :last_name, :username,
                                          :birthday, :bio, :phone, :city, :country_id, :time_zone,
                                          :gender, :degree_type, :short_bio, :video_url, :subject,
                                          :total_years_of_expirience, :rate, speaks_attributes: [:id, :level, :language_id])
  end

  def after_update_redirection
    if request.referrer.match?(/settings/)
      flash[:notice] = t('details_controller.update.success')
      redirect_back(fallback_location: schedule_tutors_settings_path)
    elsif request.referrer.match?(/photo/)
      redirect_to bio_tutors_details_path, notice: t('details_controller.update.success')
    elsif request.referrer.match?(/bio/)
      redirect_to video_tutors_details_path, notice: t('details_controller.update.success')
    elsif request.referrer.match?(/video/)
      redirect_to schedule_tutors_details_path, notice: t('details_controller.update.success')
    elsif request.referrer.match?(/schedule/)
      redirect_to tutors_dashboard_path, notice: t('details_controller.update.success')
    end
  end

  def after_successfull_create_redirection
    if request.referrer.match?(/profile/)
      redirect_to tutors_profile_path, notice: t('details_controller.update.success')
    else
      redirect_to photo_tutors_details_path, notice: t('details_controller.update.success')
    end
  end
end
