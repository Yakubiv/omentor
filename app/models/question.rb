class Question < ApplicationRecord
  belongs_to :homework_preset
  belongs_to :tutor_profile, class_name: 'TutorProfile', foreign_key: 'tutor_profile_id'

  has_many :question_options

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
