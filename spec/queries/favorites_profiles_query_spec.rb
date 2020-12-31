require 'rails_helper'

RSpec.describe FavoritesProfilesQuery do
  describe '.results' do
    context 'tutors favorites' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_favorite_first) { create(:student_profile) }
      let(:student_favorite_second) { create(:student_profile) }

      it 'returns all favorites profiles when search string empty' do
        current_tutor_profile.favorites.create(favoritable: student_favorite_first)
        current_tutor_profile.favorites.create(favoritable: student_favorite_second)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: '' }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([student_favorite_first, student_favorite_second])
      end

      it 'find favorites profiles by first name' do
        current_tutor_profile.favorites.create(favoritable: student_favorite_first)
        current_tutor_profile.favorites.create(favoritable: student_favorite_second)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_favorite_first.first_name }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([student_favorite_first])
      end

      it 'find favorites profiles by last name' do
        current_tutor_profile.favorites.create(favoritable: student_favorite_first)
        current_tutor_profile.favorites.create(favoritable: student_favorite_second)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_favorite_first.last_name }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([student_favorite_first])
      end

      it 'find favorites profiles by country name' do
        current_tutor_profile.favorites.create(favoritable: student_favorite_first)
        current_tutor_profile.favorites.create(favoritable: student_favorite_second)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_favorite_first.country_name }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([student_favorite_first])
      end

      it 'find favorites profiles by city' do
        current_tutor_profile.favorites.create(favoritable: student_favorite_first)
        current_tutor_profile.favorites.create(favoritable: student_favorite_second)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_favorite_first.city }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([student_favorite_first])
      end
    end

    context 'students favorites' do
      let(:current_student_profile) { create(:student_profile) }
      let(:tutor_favorite_first) { create(:tutor_profile) }
      let(:tutor_favorite_second) { create(:tutor_profile) }

      it 'returns all favorites profiles when search string empty' do
        current_student_profile.favorites.create(favoritable: tutor_favorite_first)
        current_student_profile.favorites.create(favoritable: tutor_favorite_second)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: '' }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([tutor_favorite_first, tutor_favorite_second])
      end

      it 'find favorites profiles by first name' do
        current_student_profile.favorites.create(favoritable: tutor_favorite_first)
        current_student_profile.favorites.create(favoritable: tutor_favorite_second)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_favorite_first.first_name }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([tutor_favorite_first])
      end

      it 'find favorites profiles by last name' do
        current_student_profile.favorites.create(favoritable: tutor_favorite_first)
        current_student_profile.favorites.create(favoritable: tutor_favorite_second)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_favorite_first.last_name }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([tutor_favorite_first])
      end

      it 'find favorites profiles by country name' do
        current_student_profile.favorites.create(favoritable: tutor_favorite_first)
        current_student_profile.favorites.create(favoritable: tutor_favorite_second)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_favorite_first.country_name }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([tutor_favorite_first])
      end

      it 'find favorites profiles by city' do
        current_student_profile.favorites.create(favoritable: tutor_favorite_first)
        current_student_profile.favorites.create(favoritable: tutor_favorite_second)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_favorite_first.city }

        query = FavoritesProfilesQuery.new(params).results

        expect(query).to match_array([tutor_favorite_first])
      end
    end
  end
end