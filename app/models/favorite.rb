class Favorite < ApplicationRecord
  belongs_to :profile
  belongs_to :favoritable, polymorphic: true
end
