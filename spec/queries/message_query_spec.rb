require 'rails_helper'

RSpec.describe MessageQuery do
  describe '.results' do
    context 'tutors messages' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_profile) { create(:student_profile) }
      let(:class_room) { student_profile.class_rooms.create(tutor_profile: current_tutor_profile) }

      it 'return all messages when search string empty' do
        message1 = class_room.messages.create(body: 'hello', profile_id: student_profile.id)
        message2 = class_room.messages.create(body: 'test2', profile_id: student_profile.id)
        params = { class_room: class_room, search_string: '' }

        query = MessageQuery.new(params).results

        expect(query).to match_array([message1, message2]) 
      end

      it 'find message by message body' do
        message1 = class_room.messages.create(body: 'hello', profile_id: student_profile.id)

        params = { class_room: class_room, search_string: 'hel' }

        query = MessageQuery.new(params).results

        expect(query).to match_array([message1]) 
      end
    end

    context 'students messages' do
      let(:current_student_profile) { create(:student_profile) }
      let(:tutor_profile) { create(:tutor_profile) }
      let(:class_room) { tutor_profile.class_rooms.create(student_profile: current_student_profile) }

      it 'return all messages when search string empty' do
        message1 = class_room.messages.create(body: 'hello', profile_id: tutor_profile.id)
        message2 = class_room.messages.create(body: 'test2', profile_id: tutor_profile.id)
        params = { class_room: class_room, search_string: '' }

        query = MessageQuery.new(params).results

        expect(query).to match_array([message1, message2]) 
      end

      it 'find message by message body' do
        message1 = class_room.messages.create(body: 'hello', profile_id: tutor_profile.id)

        params = { class_room: class_room, search_string: 'hel' }

        query = MessageQuery.new(params).results

        expect(query).to match_array([message1]) 
      end
    end
  end
end
