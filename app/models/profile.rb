# frozen_string_literal: true

class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  monetize :rate_cents

  has_one_attached :avatar

  enum gender: %i[male female]
  enum degree_type: %i[university schoole tests other]
  enum status: %i[pending active inactive]

  belongs_to :user, optional: true
  belongs_to :country

  has_and_belongs_to_many :subjects

  before_create :set_country_name

  def name
    [first_name, last_name].join(' ')
  end

  private

  def set_country_name
    self.country_name = I18n.t("countries.#{country.code}")
  end
end
