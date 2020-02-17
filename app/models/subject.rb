class Subject < ApplicationRecord
  validates :name, uniqueness: true

  enum status: %i[active pending inactive]

  def to_s
    name
  end
end
