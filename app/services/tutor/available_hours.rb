class Tutor::AvailableHours
  EVERY_30_MINS = 30.minutes
  TIME_FORMAT = '%H:%M'.freeze
  DATE_FORMAT = '%Y-%m-%d'.freeze

  def initialize(tutor_profile, lesson, start_date)
    @tutor_profile = tutor_profile
    @lesson = lesson
    @start_date = (start_date || Date.current).beginning_of_week
    @end_date = @start_date.end_of_week
  end

  def fetch
    available_time_slots_frames.group_by { |time| time[:date].to_s }
  end

  private

  attr_reader :tutor_profile, :start_date, :end_date, :lesson

  def tutor_time_slots
    tutor_profile.time_slots.where(start_at: start_date..end_date)
  end

  def available_time_slots_frames
    tutor_time_slots.flat_map do |time_slot|
      (time_slot.start_at.to_i..(time_slot.end_at - lesson.duration.minutes).to_i).step(EVERY_30_MINS).map do |date|
        { date: Time.at(date).strftime(DATE_FORMAT),
          time: Time.at(date).strftime(TIME_FORMAT),
          status: ['free', 'booked'].sample,
          time_slot_id: time_slot.id }
      end
    end
  end

end