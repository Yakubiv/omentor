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
    case resource.class.to_s
    when 'Student'
      students_dashboard_path
    when 'Tutor'
      tutors_dashboard_path
    when 'Admin'
      admin_dashboard_path
    end
  end
end
