class ChatChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug 'subscribed'
    stream_from 'chat_channel'
  end

  def unsubscribed
    Rails.logger.debug 'unsubscribed'
  end

  def send_message(data)
    current_user.messages.create(body: data['message'])
  end
end
