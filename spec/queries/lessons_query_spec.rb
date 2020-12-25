require 'rails_helper'

RSpec.describe LessonsQuery do
  describe '.results' do
    context 'tutors lessons' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_profile) { create(:student_profile) }
      let(:class_room) { student_profile.class_rooms.create(tutor_profile: current_tutor_profile) }
      let(:subject_math) { create(:subject, name: 'Math') }
      let(:subject_phis) { create(:subject, name: 'Phis') }

      it 'returns all lessons when search string empty' do
        lesson_math = create(:lesson, class_room_id: class_room.id, subject: subject_math)
        lesson = create(:lesson, class_room: class_room, subject: subject_phis)
        params = { current_tutor_profile: current_tutor_profile, type: 'tutor', search_string: '' }
        query = LessonsQuery.new(params).results

        expect(query.size).to include([lesson_math, lesson])
      end

      it 'finds lessons by subject' do
      end

      it 'find lessons by first name'
      it 'find lessons by last name name'
    end

    context 'students lessons' do
    end
  end
end
