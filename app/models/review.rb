class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, foreign_key: :reviewer_id, class_name: 'StudentProfile'
  validates :description, presence: true, length: { minimum: 5, maximum: 100 }
end
