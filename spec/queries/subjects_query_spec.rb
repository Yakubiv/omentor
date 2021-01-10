require 'rails_helper'

RSpec.describe SubjectsQuery do
  describe '.call' do
    context 'when tutor has autocomplete to subjects' do
      it 'return all subjects when params name empry' do
        subject_phis = create(:subject, status: Subject.statuses[:active])
        subject_math = create(:subject, status: Subject.statuses[:active])
        params = { name: '' }

        query = SubjectsQuery.new(params).call

        expect(query).to match_array([subject_phis, subject_math])
      end

      it 'find subjects by params name' do
        subject_phis = create(:subject, status: Subject.statuses[:active])
        subject_math = create(:subject, status: Subject.statuses[:active])
        params = { name: subject_phis.name }

        query = SubjectsQuery.new(params).call

        expect(query).to match_array([subject_phis])
      end
    end
  end
end
