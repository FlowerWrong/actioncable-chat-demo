class User < ApplicationRecord
  include Clearance::User

  has_many :sent_messages, foreign_key: :sender_id, class_name: :Message, dependent: :destroy
  has_many :received_messages, foreign_key: :receiver_id, class_name: :Message
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
end
