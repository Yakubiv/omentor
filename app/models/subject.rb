class Subject < ApplicationRecord
  include PgSearch::Model

  pg_search_scope(
    :search_by_name,
    against: %i[
      name
    ],
    using: {
      tsearch: { prefix: true, any_word: true }
    }
  )

  validates :name, uniqueness: true

  has_and_belongs_to_many :profiles

  enum status: %i[active pending inactive]

  def to_s
    name
  end
end
