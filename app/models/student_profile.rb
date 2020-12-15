# frozen_string_literal: true

class StudentProfile < Profile
  has_many :class_rooms
  has_many :tutor_profiles, through: :class_rooms, dependent: :destroy
  has_many :lessons, through: :class_rooms
  has_many :favorites, foreign_key: :profile_id
  has_many :favorite_tutor_profiles, through: :favorites, source: :favoritable, source_type: 'Profile'
  belongs_to :class_room
end
