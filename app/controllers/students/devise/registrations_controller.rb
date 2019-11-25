# frozen_string_literal: true

class Students::Devise::RegistrationsController < Devise::RegistrationsController
  private

  def after_inactive_sign_up_path_for(_)
    students_pending_path
  end
end