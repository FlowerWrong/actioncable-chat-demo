u1 = User.create!(email: 'u1@example.com', password: '111111')
u2 = User.create!(email: 'u2@example.com', password: '111111')
u3 = User.create!(email: 'u3@example.com', password: '111111')
u4 = User.create!(email: 'u4@example.com', password: '111111')

Chatroom.transaction do
  room = Chatroom.create!(name: 'u1-u2')
  ChatroomUser.create!(user_id: u1.id, chatroom_id: room.id)
  ChatroomUser.create!(user_id: u2.id, chatroom_id: room.id)
end

Chatroom.transaction do
  room = Chatroom.create!(name: 'u1-u2-u3')
  ChatroomUser.create!(user_id: u1.id, chatroom_id: room.id)
  ChatroomUser.create!(user_id: u2.id, chatroom_id: room.id)
  ChatroomUser.create!(user_id: u3.id, chatroom_id: room.id)
end
