require 'securerandom'

class Lesson < ApplicationRecord
  ONE_HOUR_DURATION = 60.0
  enum status: %i[pending canceled paid completed]

  before_save :set_uuid

  def to_param
    uuid
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
