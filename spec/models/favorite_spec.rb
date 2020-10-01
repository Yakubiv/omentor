require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:student_profile) { create(:student_profile) }
  let(:tutor_profile) { create(:tutor_profile) }

  it "should require the profile id to be unique" do
    create(:favorite, profile: student_profile, favoritable: tutor_profile)
    duplicate = build(:favorite, profile: student_profile, favoritable: tutor_profile)

    expect(duplicate.valid?).to be_falsy
  end
end
