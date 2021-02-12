class Review < ApplicationRecord
  belongs_to :profile
  validates :description, presence: true, length: { minimum: 5, maximum: 100 }
end
