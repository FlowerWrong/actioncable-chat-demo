class ChatroomsController < ApplicationController
  before_action :require_login

  def index
    @rooms = current_user.chatrooms
  end

  def create
    Chatroom.transaction do
      @room = Chatroom.create!(name: params[:name])
      user_ids = params[:user_ids]
      user_ids.each do |uid|
        ChatroomUser.create!(user_id: uid, chatroom_id: @room.id)
      end
    end
  end
end
