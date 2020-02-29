# frozen_string_literal: true

class TutorProfilesQuery
  def initialize(relation, params)
    @relation = relation
    @params = params.to_h.symbolize_keys
  end

  def call
    @relation.where(search_query)
  end

  def min_rate
    tutor_rates.min
  end

  def max_rate
    tutor_rates.max
  end

  private

  def tutor_rates
    @tutor_rates ||= @relation.pluck(:rate)
  end

  def subject
    @subject ||= Subject.find_by(name: @params.fetch(:subject, ''))
  end

  def search_query
    @params.keys.map do |param|
      send("#{param}_sql")
    end.compact.join(' AND ')
  end

  def subject_sql
    return unless subject
  end

  def days_sql
    return if @params.fetch(:days, '').blank?
  end

  def periods_sql
    return if @params.fetch(:periods, '').blank?
  end

  def price_range_sql
    return if @params.fetch(:price_range, '').blank?

    min_price, max_price = @params.fetch(:price_range).split(',')
    "rate BETWEEN #{min_price} AND #{max_price}"
  end
end
