# frozen_string_literal: true

class TutorProfile < Profile
  has_many :time_slots, foreign_key: :profile_id
end
