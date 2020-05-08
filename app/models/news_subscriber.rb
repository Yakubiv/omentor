class NewsSubscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
