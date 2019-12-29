# frozen_string_literal: true

class Devises::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(_resource_name, resource)
    sign_in(resource)

    case resource.sign_up_as
    when 'student'
      students_details_path
    when 'tutor'
      tutors_details_path
    end
  end
end
