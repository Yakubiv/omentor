# frozen_string_literal: true

class Devises::RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :terms_and_conditions, :sign_up_as)
  end

  private

  def after_inactive_sign_up_path_for(resource)
    session[:pending_user_email] = resource.email
    pending_users_path
  end
end
