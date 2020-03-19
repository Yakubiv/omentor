# frozen_string_literal: true

class Tutors::StudentProfilesController < Tutors::BaseController
  def index
    @students = current_tutor_profile.student_profiles
  end

  def show
    @student_profile = current_tutor_profile.student_profiles.friendly
                                            .find(params[:id])
    @class_room = current_tutor_profile.class_rooms.find_by(student_profile_id: @student_profile.id)
    @lessons = current_tutor_profile.lessons.for_student(@class_room)
  end
end