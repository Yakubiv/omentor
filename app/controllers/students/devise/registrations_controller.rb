# frozen_string_literal: true

class Students::Devise::RegistrationsController < Devise::RegistrationsController
  private

  def after_inactive_sign_up_path_for(resource)
    session[:pending_email] = resource.email
    students_pending_path
  end
end