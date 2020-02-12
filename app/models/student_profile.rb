# frozen_string_literal: true

class StudentProfile < Profile
  has_many :class_rooms
  has_many :tutor_profiles, through: :class_rooms, dependent: :destroy
end
