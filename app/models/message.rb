class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true

  after_create :broadcast_message

  def as_json(options = {})

    user = User.find_by(id: user_id)

    {
      id: id,
      author: user.nickname,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end

  private

  def broadcast_message
    ActionCable.server.broadcast("channel_#{channel.name}", self.to_json)
  end
end
