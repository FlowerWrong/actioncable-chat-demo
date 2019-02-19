class Message < ApplicationRecord
  belongs_to :chatroom, optional: true
  belongs_to :sender, class_name: :User, foreign_key: 'sender_id'
  belongs_to :receiver, class_name: :User, foreign_key: 'receiver_id', optional: true

  validates :body, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end
end
