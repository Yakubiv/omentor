# frozen_string_literal: true

class TutorProfile < Profile
  has_many :time_slots, foreign_key: :profile_id
  has_many :class_rooms
  has_many :student_profiles, through: :class_rooms, dependent: :destroy
  has_many :lessons, through: :class_rooms
  has_many :speaks, foreign_key: :profile_id
  has_many :favorites, foreign_key: :profile_id
  has_many :favorite_student_profiles, through: :favorites, source: :favoritable, source_type: 'Profile'
  has_many :reviews, as: :reviewable
  has_many :homework_presets, foreign_key: :profile_id

  accepts_nested_attributes_for :speaks, allow_destroy: true

  def subject=(subject_name)
    subject_record = Subject.find_or_create_by(name: subject_name)
    update(subject_ids: [subject_record.id])
  end

  def price_for_hour_lesson
    (rate * Lesson::ONE_HOUR_DURATION) / 60.0
  end
end
