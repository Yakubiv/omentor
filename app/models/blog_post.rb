class BlogPost < ApplicationRecord
  FULL_DATE = '%d %B, %Y %H:%M'.freeze
  SHORT_DATE = '%d %B, %H:%M'.freeze
  DEFAULT_DATE = '%d %B %Y'.freeze
  DATE = '%d/%m'.freeze
  TIME = '%H:%M'.freeze
  ITEMS_PER_PAGE = 15

  extend FriendlyId
  include PgSearch::Model

  has_one_attached :thumbnail
  has_rich_text :body
  friendly_id :title, use: :slugged

  is_impressionable counter_cache: true, unique: true
  acts_as_taggable_on :tags

  belongs_to :author, foreign_key: :user_id, class_name: 'User'

  # enum category: { interesting: 1, culture: 2, news: 3, buity: 4, important: 5, art: 6, other: 7, style: 8, trands: 9 }
  enum status: { draft: 1, published: 2 }

  before_save :set_publish_at

  validates :title, :body, presence: true

  pg_search_scope(
    :search,
    associated_against: {
      rich_text_description: :body
    },
    against: %i[
      description
      title
    ],
    using: {
      tsearch: { prefix: true }
    }
  )

  def should_generate_new_friendly_id?
    slug.blank?
  end

  def to_meta_tags
    { title: meta_title,
      description: meta_description,
      keywords: meta_tags.join(', ') }
  end

  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :russian).to_s
  end

  def show(type)
    { status: BlogPost.human_enum_name(:statuses, status) }[type]
  end

  private

  def set_publish_at
    self.publish_at = Time.current unless publish_at
  end
end
