# jQuery(document).on 'turbolinks:load', ->
#   App.chat = App.cable.subscriptions.create {
#       channel: "RoomChannel",
#       chatroom_id: 1
#     },
#     connected: ->
#       console.log('connected')
#
#     disconnected: ->
#       console.log('disconnected')
#
#     received: (data) ->
#       console.log(data)
#
#     speak: (message) ->
#       console.log(message)

jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $new_message_form = $('#new-message')
  $new_message_body = $new_message_form.find('#message-body')

  $.get '/chatrooms.json', (data) ->
    console.log(data)
    for room in data
      do (room) ->
        room_id = room.id
        App['room-' + room_id] = App.cable.subscriptions.create {
            channel: "RoomChannel",
            chatroom_id: room_id
          },
          connected: ->
            console.log('connected', room_id)

          disconnected: ->
            console.log('disconnected', room_id)

          received: (data) ->
            console.log(data, room_id)
            if data['message']
              $new_message_body.val('')
              $messages.append data['message']

          speak: (message) ->
            @perform 'speak', message: message, chatroom_id: room_id

  $new_message_form.submit (e) ->
    $this = $(this)
    message_body = $new_message_body.val()
    room_id = $('#room_id').val()

    if $.trim(message_body).length > 0
      App['room-' + room_id].speak message_body

    e.preventDefault()
    return false
