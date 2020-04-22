require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  context '#validation' do
    context 'when tag list provided' do
      it 'creates tags' do
        blog = build(:blog_post, tag_list: 'Навчання, ЗНО, Test')

        blog.save!

        expect(blog.tags.count).to eq 3
      end

      it 'uses existing tags, if Ukr tag is present' do
        create(:blog_post, tag_list: 'Навчання')
        blog_copy = create(:blog_post, tag_list: 'Навчання, НовийРік')

        expect(blog_copy.tags.count).to eq 2
      end

      it 'uses existing tags, if eng tag is present' do
        create(:blog_post, tag_list: 'Rails')
        blog_copy = create(:blog_post, tag_list: 'Rails, НовийРік')

        expect(blog_copy.tags.count).to eq 2
      end
    end
  end
end
