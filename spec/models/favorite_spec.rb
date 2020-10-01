require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:profile) { create(:favorite, profile: profile) }
  it "should require the profile id to be unique" do
    Favorite.create(:favorite, profile: profile)
    duplicate = build(:favorite, profile: profile)
    expect(duplicate.valid?).to be_falsy
  end
end
