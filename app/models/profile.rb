# frozen_string_literal: true

class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  has_one_attached :avatar

  enum gender: %i[male female]
  enum degree_type: %i[university schoole tests other]
  enum status: %i[pending active inactive]

  belongs_to :user, optional: true

  def name
    [first_name, last_name].join(' ')
  end
end