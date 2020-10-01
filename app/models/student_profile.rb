# frozen_string_literal: true

class StudentProfile < Profile
  has_many :class_rooms
  has_many :tutor_profiles, through: :class_rooms, dependent: :destroy
  has_many :lessons, through: :class_rooms
  has_many :favorites, foreign_key: :profile_id
  has_many :favorite_tutor_profiles, through: :favorites, source: :favoritable, source_type: 'Profile'

  def favorite?(favoritable)
    favorites.where(
      favoritable_id: favoritable.id,
      favoritable_type: favoritable.class.base_class.name
    ).size.positive?
  end
end
