class Subject < ApplicationRecord
  validates :name, uniqueness: true

  has_and_belongs_to_many :profiles

  enum status: %i[active pending inactive]

  def to_s
    name
  end
end
