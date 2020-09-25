class Favorite < ApplicationRecord
  belongs_to :profile
  belongs_to :favoritable, polymorphic: true
  validates :favoritable_id, uniqueness: { scope: :profile_id }
end
