class Message < ApplicationRecord
  MESSAGE_TIME = '%H:%M'.freeze
  belongs_to :class_room
  belongs_to :sender, foreign_key: :profile_id, class_name: 'Profile'

  validates_presence_of :body, :class_room_id, :profile_id

  scope :my_unread_messages, ->(sender) { where(read: false).where.not(profile_id: sender.id) }

  default_scope { order(created_at: :asc) }

  def message_time
    created_at.strftime(MESSAGE_TIME)
  end
end
