class Country < ApplicationRecord
  validates :code, uniqueness: true

  def to_s
    I18n.t("countries.#{code}")
  end
end
