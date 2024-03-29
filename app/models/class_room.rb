# frozen_string_literal: true

class ClassRoom < ApplicationRecord
  belongs_to :student_profile, class_name: 'StudentProfile', foreign_key: 'student_profile_id'
  belongs_to :tutor_profile, class_name: 'TutorProfile', foreign_key: 'tutor_profile_id'
  has_many :lessons
  has_many :messages

  before_create :set_uuid

  def opposet_profile_to(profile)
    profile == student_profile ? tutor_profile : student_profile
  end

  def to_param
    uuid
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
