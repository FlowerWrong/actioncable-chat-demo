class RoomChannel < ApplicationCable::Channel
  def subscribed
    if params[:chatroom_id].present?
      room = Chatroom.find(params[:chatroom_id])
      Rails.logger.debug "subscribed #{room.id}"
      stream_from("chatroom-#{room.id}")
    end
  end

  def unsubscribed
    Rails.logger.debug 'unsubscribed'
  end

  def speak(data)
    current_user.sent_messages.create(body: data['message'], receiver_id: data['receiver_id'], chatroom_id: data['chatroom_id'])
  end
end
