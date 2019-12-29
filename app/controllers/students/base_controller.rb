# frozen_string_literal: true

class Students::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_is_student?
  layout 'students'

  def current_student_profile
    current_user.student_profile
  end
  helper_method :current_student_profile

  def current_user_is_student?
    redirect_to tutor_dashboard_path unless current_user.student?
  end

  def redirect_to_default
    redirect_to root_path
  end
end
sw2cdexdeswdsw2de3