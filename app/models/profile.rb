# frozen_string_literal: true

class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  monetize :rate_cents

  has_one_attached :avatar
  has_many :vacations

  enum gender: %i[male female]
  enum degree_type: %i[university schoole tests other]
  enum status: %i[pending active inactive]

  belongs_to :user, optional: true
  belongs_to :country

  has_and_belongs_to_many :subjects

  before_create :set_country_name

  delegate :email, to: :user

  def name
    [first_name, last_name].join(' ')
  end

  def show(type)
    { status: Profile.human_enum_name(:statuses, status) }[type]
  end

  def initials
    "#{first_name[0]}#{last_name[0]}".upcase
  end

  def favorite?(favoritable)
    favorites.where(
      favoritable_id: favoritable.id,
      favoritable_type: favoritable.class.base_class.name
    ).size.positive?
  end

  private

  def set_country_name
    self.country_name = I18n.t("countries.#{country.code}")
  end
end
