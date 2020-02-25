class Country < ApplicationRecord
  validates :code, uniqueness: true
end
