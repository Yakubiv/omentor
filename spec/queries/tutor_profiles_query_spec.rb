require 'rails_helper'

RSpec.describe TutorProfilesQuery do
  describe '.call' do
    context 'tutor profiles' do
      let(:subject_math) { create(:subject) }
      let(:time_slot_first) { create(:time_slot) }

      let(:subject_phis) { create(:subject) }
      let(:time_slot_second) { create(:time_slot) }

      it 'return all profiles when params empty' do
        tutor_profile_first = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_math.id,
                                time_slot_ids: time_slot_first.id)
        tutor_profile_second = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_phis.id,
                                time_slot_ids: time_slot_second.id)
        params = {}

        query = TutorProfilesQuery.new(TutorProfile.active, params).call

        expect(query).to match_array([tutor_profile_first, tutor_profile_second])
      end

      it 'find profiles by subject' do
        tutor_profile_first = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_math.id,
                                time_slot_ids: time_slot_first.id)
        tutor_profile_second = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_phis.id,
                                time_slot_ids: time_slot_second.id)
        params = { 'subject'=>tutor_profile_first.subjects.first.name }

        query = TutorProfilesQuery.new(TutorProfile.active, params).call

        expect(query).to match_array([tutor_profile_first])
      end

      it 'find profiles by days' do
        tutor_profile_first = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_math.id,
                                time_slot_ids: time_slot_first.id)
        tutor_profile_second = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_phis.id,
                                time_slot_ids: time_slot_second.id)
        params = { 'subject'=>tutor_profile_first.subjects.first.name,
                   'days'=>[tutor_profile_first.time_slots.first.wday] }

        query = TutorProfilesQuery.new(TutorProfile.active, params).call

        expect(query).to match_array([tutor_profile_first])
      end

      it 'find profiles by time slots' do
        tutor_profile_first = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_math.id,
                                time_slot_ids: time_slot_first.id)
        tutor_profile_second = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_phis.id,
                                time_slot_ids: time_slot_second.id)
        start_at = tutor_profile_first.time_slots.first.start_at.time.strftime("%k")
        end_at = tutor_profile_first.time_slots.first.end_at.time.strftime("%k")
        params = { 'subject'=>tutor_profile_first.subjects.first.name,
                   'days'=>[tutor_profile_first.time_slots.first.wday],
                   'periods'=>["#{start_at}-#{end_at}"] }

        query = TutorProfilesQuery.new(TutorProfile.active, params).call

        expect(query).to match_array([tutor_profile_first])
      end

      it 'find profiles by price range' do
        tutor_profile_first = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_math.id,
                                time_slot_ids: time_slot_first.id)
        tutor_profile_second = create(:tutor_profile,
                                status: Profile.statuses[:active],
                                subject_ids: subject_phis.id,
                                time_slot_ids: time_slot_second.id)
        start_at = tutor_profile_first.time_slots.first.start_at.time.strftime('%k')
        end_at = tutor_profile_first.time_slots.first.end_at.time.strftime('%k')
        params = { 'subject'=>'tutor_profile_first.subjects.first.name',
                   'days'=>[tutor_profile_first.time_slots.first.wday],
                   'periods'=>["#{start_at}-#{end_at}"],
                   'price_range'=>'0,900' }

        query = TutorProfilesQuery.new(TutorProfile.active, params).call

        expect(query).to match_array([tutor_profile_first])
      end
    end
  end
end
