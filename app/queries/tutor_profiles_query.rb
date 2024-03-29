# frozen_string_literal: true

class TutorProfilesQuery
  CENTS = 100

  def initialize(relation, params)
    @relation = relation
    @params = params.to_h.symbolize_keys
  end

  def call
    @relation.includes(:subjects, :time_slots).where(search_query)
  end

  def min_rate
    @min_rate ||= Money.new(100)
  end

  def max_rate
    @max_rate ||= Money.new(900_00)
  end

  private

  def subject
    @subject ||= Subject.find_by(name: @params.fetch(:subject, ''))
  end

  def search_query
    @params.keys.map do |param|
      send("#{param}_condition")
    end.compact.reduce({}, :merge)
  end

  def subject_condition
    return unless subject

    { subjects: { id: subject.id } }
  end

  def days_condition
    return if @params.fetch(:days, '').blank?

    { time_slots: { wday: @params[:days].map(&:downcase) } }
  end

  def periods_condition
    return if @params.fetch(:periods, '').blank?
  end

  def price_range_condition
    return if @params.fetch(:price_range, '').blank?

    min_price, max_price = @params.fetch(:price_range).split(',').flat_map(&:to_i)
    { rate_cents: (min_price * CENTS)..(max_price * CENTS) }
  end
end
