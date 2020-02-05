class Subject < ApplicationRecord
  validates :name, uniqueness: true

  enum status: %i[active pending inactive]
end
