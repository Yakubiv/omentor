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
    if resource.student?
      students_dashboard_path
    else
      tutors_dashboard_path
    end
  end
end
