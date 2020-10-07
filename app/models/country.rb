class Country < ApplicationRecord
  validates :code, uniqueness: true
  has_one :language

  def to_s
    I18n.t("countries.#{code}")
  end
end
