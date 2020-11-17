class Feedback < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :describe, presence: true, length: { minimum: 10, maximum: 250 }
end
