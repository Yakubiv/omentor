# frozen_string_literal: true

class TutorProfile < Profile
  has_many :time_slots, foreign_key: :profile_id
  has_many :class_rooms
  has_many :student_profiles, through: :class_rooms, dependent: :destroy
end
