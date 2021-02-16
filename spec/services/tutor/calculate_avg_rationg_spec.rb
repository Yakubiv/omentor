require 'rails_helper'

RSpec.describe Tutor::CalculateAvgRating do
  describe '.calculate' do
    it 'returns zero if tutor does not have reviews' do
      tutor_profile = create(:tutor_profile)

      described_class.new(tutor_profile).calculate

      expect(tutor_profile.reload.stars).to eq(0.0)
    end

    it 'updates tutor wuth avr stars from reviews' do
      tutor_profile = create(:tutor_profile)
      create(:review, reviewable: tutor_profile, stars: 5)

      described_class.new(tutor_profile).calculate

      expect(tutor_profile.reload.stars).to eq(5)
    end

    context 'when multiples reviews' do
      it 'updates tutor profile with avg stars' do
        tutor_profile = create(:tutor_profile)
        create(:review, reviewable: tutor_profile, stars: 5)
        create(:review, reviewable: tutor_profile, stars: 4)

        described_class.new(tutor_profile).calculate

        expect(tutor_profile.reload.stars).to eq(4.5)
      end
    end
  end
end
