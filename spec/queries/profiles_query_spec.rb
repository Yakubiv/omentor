require 'rails_helper'

RSpec.describe ProfilesQuery do
  describe '.results' do
    context 'tutors profiles' do
      let(:current_tutor_profile) {create(:tutor_profile)}
      let(:student_profile) {create(:student_profile)}
      let(:class_room) {student_profile.class_rooms.create(tutor_profile: current_tutor_profile)}

      it 'returns all profiles when search string empty' do
        student_profile = create(:student_profile)
        params = { current_tutor_profile: current_tutor_profile, type: 'students', search_string: '' }

        query = ProfilesQuery.new(params).results
        
        expect(query).to match_array([student_profile])  
      end
    end

    context 'students profiles' do
      
    end
    
  end
end
