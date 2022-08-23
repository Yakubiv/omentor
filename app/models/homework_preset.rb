class HomeworkPreset < ApplicationRecord
  validates :description, presence: true
  validates :subject_theme, presence: true

  belongs_to :subject
  belongs_to :tutor_profile, foreign_key: :profile_id

  scope :active, -> { where(active: true) }
end
