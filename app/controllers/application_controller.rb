class ApplicationController < ActionController::Base
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
