class Speak < ApplicationRecord
    belongs_to :tutor_profile, foreign_key: :profile_id
    has_one :language
    enum level: %i[beginer(A1) elementary(A2) intermediate(B1) upper-intermediate(B2) advanced(C1) proficiency(C2) native]
end
