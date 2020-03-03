# frozen_string_literal: true

class TutorProfile < Profile
  has_many :time_slots, foreign_key: :profile_id
  has_many :class_rooms
  has_many :student_profiles, through: :class_rooms, dependent: :destroy
  has_many :lessons, through: :class_rooms

  def subject=(subject_name)
    subject_record = Subject.find_or_create_by(name: subject_name)

    update(subject_ids: [subject_record.id])
  end
end
