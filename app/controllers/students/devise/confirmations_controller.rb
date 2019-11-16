# frozen_string_literal: true

class Students::Devise::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(_resource_name, resource)
    sign_in(resource)
    students_join_path
  end
end
