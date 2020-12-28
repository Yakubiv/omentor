require 'rails_helper'

RSpec.describe ChatQuery do
  describe '.results' do 
    context 'tutors chats' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_profile) { create(:student_profile) }
      
      it 'return all chats when search string empty' do
        chat = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile.id, student_profile: student_profile)

        params = { current_tutor_profile: current_tutor_profile, type: 'student', search_string: '' }

        query = ChatQuery.new(params).results
        
        binding.pry
        
        expect(query).to match_array([chat]) 
      end           
    end
  end
end
