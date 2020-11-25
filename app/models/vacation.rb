class Vacation < ApplicationRecord
  belongs_to :profile
  enum status: %i[active canceled]
end
