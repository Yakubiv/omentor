class Question < ApplicationRecord
  belongs_to :homework_preset
  belongs_to :tutor_profile, class_name: 'TutorProfile', foreign_key: 'tutor_profile_id'
end
