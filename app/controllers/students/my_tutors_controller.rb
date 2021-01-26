# frozen_string_literal: true

class Students::MyTutorsController < Students::BaseController
  before_action :student_chat_ids, only: :index

  def index
    @tutors = ProfilesQuery.new(query_params).results
  end

  def show
    @tutor_profile = current_student_profile.tutor_profiles.friendly.find(params[:id])
    @class_room = current_student_profile.class_rooms.find_by(tutor_profile_id: @tutor_profile.id)
    @lessons = current_student_profile.lessons.for_tutor(@class_room)
    @decorated_tutor_profile = TutorProfileDecorator.new(@tutor_profile)
  end

  private

  def query_params
    { current_student_profile: current_student_profile,
      type: "tutors",
      search_string: params[:search] }
  end
end