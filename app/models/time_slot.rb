class TimeSlot < ApplicationRecord
  DATE_FORMAT     = '%Y-%m-%d'
  DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%S'

  validates :start_at, :end_at, presence: true

  validate :validate_start_at_before_end_at

  def all_day_event?
    start_at == start_at.midnight && end_at == end_at.midnight
  end

  private

  def validate_start_at_before_end_at
    if start_at > end_at
      errors.add(:end_at, "can't be in the past")
    end
  end
end
