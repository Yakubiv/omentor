# frozen_string_literal: true

class Students::DetailsController < Students::BaseController
  skip_before_action :authenticate_student!, only: :pending

  layout 'login', only: :pending

  def show

  end

  def update

  end

  def pending
    user_redirection if student_signed_in?
  end

  private

  def user_redirection
    if current_student.first_name.present?
      redirect_to students_dashboard_path
    else
      redirect_to students_details_path
    end
  end
end
