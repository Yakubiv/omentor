class Speak < ApplicationRecord
    belongs_to :tutor_profile, foreign_key: :profile_id
    belongs_to :language, foreign_key: :language_id
    validates :language_id, uniqueness: { scope: :profile_id }
    enum level: %i[beginer elementary intermediate upper-intermediate advanced proficiency native]
end
