require 'rails_helper'

RSpec.describe ChatQuery do
  describe '.results' do
    context 'tutors chats' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_profile_first) { create(:student_profile) }
      let(:student_profile_second) { create(:student_profile) }

      it 'return all chats when search string empty' do
        chat_first = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile_first.id)
        chat_second = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile_second.id)

        params = { current_tutor_profile: current_tutor_profile, type: 'student', search_string: '' }

        query = ChatQuery.new(params).results

        expect(query).to match_array([chat_first, chat_second])
      end

      it 'find chat by first name' do
        chat_first = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile_first.id)
        chat_second = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile_second.id)

        params = { current_tutor_profile: current_tutor_profile, type: 'student', search_string: chat_first.student_profile.first_name }

        query = ChatQuery.new(params).results

        expect(query).to match_array([chat_first])
      end

      it 'find chat by last name' do
        chat_first = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile_first.id)
        chat_second = create(:class_room, tutor_profile_id: current_tutor_profile.id, student_profile_id: student_profile_second.id)

        params = { current_tutor_profile: current_tutor_profile, type: 'student', search_string: chat_first.student_profile.last_name }

        query = ChatQuery.new(params).results

        expect(query).to match_array([chat_first])
      end
    end

    context 'students chats' do
      let(:current_student_profile) { create(:student_profile) }
      let(:tutor_profile_first) { create(:tutor_profile) }
      let(:tutor_profile_second) { create(:tutor_profile) }

      it 'return all chats when search string empty' do
        chat_first = create(:class_room, student_profile_id: current_student_profile.id, tutor_profile_id: tutor_profile_first.id)
        chat_second = create(:class_room, student_profile_id: current_student_profile.id, tutor_profile_id: tutor_profile_second.id)

        params = { current_student_profile: current_student_profile, type: 'tutor', search_string: '' }

        query = ChatQuery.new(params).results

        expect(query).to match_array([chat_first, chat_second])
      end

      it 'find chat by first name' do
        chat_first = create(:class_room, student_profile_id: current_student_profile.id, tutor_profile_id: tutor_profile_first.id)
        chat_second = create(:class_room, student_profile_id: current_student_profile.id, tutor_profile_id: tutor_profile_second.id)

        params = { current_student_profile: current_student_profile, type: 'tutor', search_string: chat_first.tutor_profile.first_name }

        query = ChatQuery.new(params).results

        expect(query).to match_array([chat_first])
      end

      it 'find chat by last name' do
        chat_first = create(:class_room, student_profile_id: current_student_profile.id, tutor_profile_id: tutor_profile_first.id)
        chat_second = create(:class_room, student_profile_id: current_student_profile.id, tutor_profile_id: tutor_profile_second.id)

        params = { current_student_profile: current_student_profile, type: 'tutor', search_string: chat_first.tutor_profile.last_name }

        query = ChatQuery.new(params).results

        expect(query).to match_array([chat_first])
      end
    end
  end
end
