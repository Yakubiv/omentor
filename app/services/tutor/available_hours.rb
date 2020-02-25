class Tutor::AvailableHours
  EVERY_30_MINS = 30.minutes
  TIME_FORMAT = '%H:%M'.freeze
  DATE_FORMAT = '%Y-%m-%d'.freeze
  BOOKED_STATUS = 'booked'.freeze
  FREE_STATUS = 'free'.freeze

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
      group_range_by_30_mins_step(time_slot.start_at, time_slot.end_at - lesson.duration.minutes).map do |date|
        slot_date = Time.at(date).strftime(DATE_FORMAT)
        slot_time = Time.at(date).strftime(TIME_FORMAT)
        { date: slot_date,
          time: slot_time,
          full_time: Time.at(date),
          status: tutor_lessons.fetch(slot_date, []).include?(slot_time) ? BOOKED_STATUS : FREE_STATUS,
          lessons: tutor_lessons,
          time_slot_id: time_slot.id }
      end
    end
  end

  def tutor_lessons
    @tutor_lessons ||= tutor_profile.lessons.group_by { |l| l.start_at.strftime(DATE_FORMAT) }.map do |date, lessons|
      time_slots = lessons.flat_map do |lesson|
        group_range_by_30_mins_step(lesson.start_at, lesson.start_at + lesson.duration.minutes - 1.minutes).map do |date|
          Time.at(date).strftime(TIME_FORMAT)
        end
      end
      [date, time_slots]
    end.to_h
  end

  def frozen_lessons
  end

  private

  def group_range_by_30_mins_step(start_at, end_at)
    (start_at.to_i..end_at.to_i).step(EVERY_30_MINS)
  end
end