class Lesson < ApplicationRecord
  ONE_HOUR_DURATION = 60.0
  # belongs_to :student_profile, class_name: 'StudentProfile', foreign_key: :profile_id
  # belongs_to :tea_profile, class_name: 'StudentProfile', foreign_key: :profile_id
end
