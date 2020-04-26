# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end

  def after_sign_in_path_for(resource)
    case resource.sign_up_as
    when 'student'
      students_dashboard_path
    when 'tutor'
      tutors_dashboard_path
    when 'admin'
      admin_dashboard_url(subdomain: 'admin.studygo')
    end
  end
end
