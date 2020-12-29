require 'rails_helper'

RSpec.describe ProfilesQuery do
  describe '.results' do
    context 'tutors profiles' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_profile_first) { create(:student_profile) }
      let(:student_profile_second) { create(:student_profile) }

      it 'returns all profiles when search string empty' do
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_first.id)
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_second.id)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: '' }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([student_profile_first, student_profile_second])
      end

      it 'find profile by first name' do
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_first.id)
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_second.id)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_profile_first.first_name }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([student_profile_first])
      end

      it 'find profile by last name' do
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_first.id)
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_second.id)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_profile_first.last_name }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([student_profile_first])
      end

      it 'find profile by country name' do
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_first.id)
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_second.id)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_profile_first.country_name }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([student_profile_first])
      end

      it 'find profile by city name' do
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_first.id)
        current_tutor_profile.class_rooms.create(student_profile_id: student_profile_second.id)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: student_profile_first.city }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([student_profile_first])
      end
    end

    context 'students profiles' do
      let(:current_student_profile) { create(:student_profile) }
      let(:tutor_profile_first) { create(:tutor_profile) }
      let(:tutor_profile_second) { create(:tutor_profile) }

      it 'returns all profiles when search string empty' do
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_first.id)
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_second.id)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: '' }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([tutor_profile_first, tutor_profile_second])
      end

      it 'find profiles by first name' do
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_first.id)
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_second.id)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_profile_first.first_name }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([tutor_profile_first])
      end

      it 'find profiles by last name' do
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_first.id)
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_second.id)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_profile_first.last_name }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([tutor_profile_first])
      end

      it 'find profiles by country name' do
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_first.id)
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_second.id)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_profile_first.country_name }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([tutor_profile_first])
      end

      it 'find profiles by city' do
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_first.id)
        current_student_profile.class_rooms.create(tutor_profile_id: tutor_profile_second.id)
        params = { current_student_profile: current_student_profile, type: 'tutors', search_string: tutor_profile_first.city }

        query = ProfilesQuery.new(params).results

        expect(query).to match_array([tutor_profile_first])
      end
    end
  end
end
