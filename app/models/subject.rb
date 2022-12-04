class Subject < ApplicationRecord
  include PgSearch::Model

  validates :name, uniqueness: true

  has_and_belongs_to_many :profiles
  has_many :homework_presets

  enum status: %i[active pending inactive]

  def to_s
    name
  end

  pg_search_scope(
    :search_by_name,
    against: %i[
      name
    ],
    using: {
      tsearch: { prefix: true, any_word: true }
    }
  )
end
