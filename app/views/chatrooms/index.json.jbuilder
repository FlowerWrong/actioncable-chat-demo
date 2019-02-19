json.array! @rooms do |room|
  json.id room.id
  json.name room.name

  json.users room.users, :id, :email
end
