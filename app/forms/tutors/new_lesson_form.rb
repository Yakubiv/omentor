class Tutors::NewLessonForm < BaseForm
  attr_accessor :price, :student_profile_id, :tutor_profile, :duration, :subject_id, :start_at, :lesson

  def initialize(params = {})
    @lesson = Lesson.new(params.slice(:duration, :price))
    super(params)
  end

  def submit
    return false unless valid?

    ActiveRecord::Base.transaction do
      lesson.attributes = person_params
      notify_student_about_new_lesson! if lesson.save
    end
  end

  private

  def notify_student_about_new_lesson!
    # to be implemented!
    true
  end

  def class_room
    tutor_profile.class_rooms.find_or_create_by(student_profile_id: student_profile_id)
  end

  def person_params
    { subject_id: subject_id,
      duration: duration,
      start_at: start_at,
      class_room_id: class_room.id }
  end
end
