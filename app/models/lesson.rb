require 'securerandom'

class Lesson < ApplicationRecord
  ONE_HOUR_DURATION = 60.0
  FULL_FORMAT = '%d %b %Y, %H:%M'.freeze
  enum status: %i[pending canceled paid completed]

  belongs_to :class_room
  belongs_to :subject
  has_one :student_profile, through: :class_room
  has_one :tutor_profile, through: :class_room

  before_create :set_uuid

  scope :future, -> { where('start_at > ?', Time.current) }

  def to_param
    uuid
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
