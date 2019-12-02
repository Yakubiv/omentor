class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :async, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  enum gender: %i[male female]
  enum degree_type: %i[university schoole tests other]
end
