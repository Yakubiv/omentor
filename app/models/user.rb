class User < ApplicationRecord
  devise :database_authenticatable, :async, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :tutor_profile
  has_one :student_profile

  enum sign_up_as: %i[student tutor admin]

  validates :terms_and_conditions, acceptance: true
end
