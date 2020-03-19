# frozen_string_literal: true

class Students::MyTutorsController < Students::BaseController
  def index
    @tutors = current_student_profile.tutor_profiles.includes(:country, :subjects)
  end

  def show
    @tutor_profile = current_student_profile.tutor_profiles.friendly.find(params[:id])
    @class_room = current_student_profile.class_rooms.find_by(tutor_profile_id: @tutor_profile.id)
    @lessons = current_student_profile.lessons.for_tutor(@class_room)
  end
end