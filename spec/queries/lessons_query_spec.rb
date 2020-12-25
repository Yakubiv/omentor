require 'rails_helper'

RSpec.describe LessonsQuery do
  describe '.results' do
    context 'tutors lessons' do
      let(:current_tutor_profile) { create(:tutor_profile) }
      let(:student_profile) { create(:student_profile, first_name: 'Mikel', last_name: 'Jackson') }
      let(:class_room) { student_profile.class_rooms.create(tutor_profile: current_tutor_profile) }
      let(:subject_math) { create(:subject, name: 'Math') }
      let(:subject_phis) { create(:subject, name: 'Phis') }

      it 'returns all lessons when search string empty' do
        lesson_math = create(:lesson, class_room_id: class_room.id, subject: subject_math)
        lesson = create(:lesson, class_room: class_room, subject: subject_phis)
        params = { current_tutor_profile: current_tutor_profile, type: 'tutor', search_string: '' }

        query = LessonsQuery.new(params).results

        expect(query.to_a).to match_array([lesson_math, lesson])
      end

      it 'finds lessons by subject' do
        lesson_math = create(:lesson, class_room_id: class_room.id, subject: subject_math)
        lesson = create(:lesson, class_room: class_room, subject: subject_phis)
        params = { current_tutor_profile: current_tutor_profile, type: 'tutor', search_string: 'Mat' }

        query = LessonsQuery.new(params).results

        expect(query.to_a).to match_array([lesson_math])
      end

      it 'find lessons by first name' do
        lesson = create(:lesson, class_room: class_room, student_profile: student_profile)
        params = { current_tutor_profile: current_tutor_profile, type: 'tutor', search_string: 'Mike' }
        
        query = LessonsQuery.new(params).results

        expect(query).to match_array([lesson])
      end

      it 'find lessons by last name' do 
        lesson = create(:lesson, class_room: class_room, student_profile: student_profile)
        params = { current_tutor_profile: current_tutor_profile, type: 'tutor', search_string: 'Jack' }
        
        query = LessonsQuery.new(params).results

        expect(query).to match_array([lesson])
      end
    end

    context 'students lessons' do
      let(:current_student_profile) { create(:student_profile) }
      let(:tutor_profile) { create(:tutor_profile, first_name: 'Fridrig', last_name: 'Jonatan') }
      let(:class_room) { tutor_profile.class_rooms.create(student_profile: current_student_profile) }
      let(:subject_math) { create(:subject, name: 'Math') }
      let(:subject_phis) { create(:subject, name: 'Phis') }

      it 'returns all lessons when search string empty' do
        lesson_math = create(:lesson, class_room: class_room, subject: subject_math)
        lesson_phis = create(:lesson, class_room: class_room, subject: subject_phis)
        params = { current_student_profile: current_student_profile, type: 'student', search_string: '' }
        
        query = LessonsQuery.new(params).results

        expect(query).to match_array([lesson_math, lesson_phis])
      end

      it 'find lesson by subject' do 
        lesson_math = create(:lesson, class_room: class_room, subject: subject_math )
        lesson_phis = create(:lesson, class_room: class_room, subject: subject_phis )
        params = { current_student_profile: current_student_profile, type: 'student', search_string: 'Mat' }

        query = LessonsQuery.new(params).results

        expect(query).to match_array([lesson_math])
      end
      
      it 'find lesson by first name' do
        lesson = create(:lesson, class_room: class_room, tutor_profile: tutor_profile)
        params = { current_student_profile: current_student_profile, type: 'student', search_string: 'Fri' }

        query = LessonsQuery.new(params).results

        expect(query).to match_array([lesson])
      end

      it 'find lesson by last name' do
        lesson = create(:lesson, class_room: class_room, tutor_profile: tutor_profile)
        params = { current_student_profile: current_student_profile, type: 'student', search_string: 'Jon' }

        query = LessonsQuery.new(params).results

        expect(query).to match_array([lesson])
      end
    end
  end
end
