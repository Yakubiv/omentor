import consumer from "./consumer"

document.addEventListener('turbolinks:load', function () {
  var messages = $('#messages');

  if (messages) {
    if (consumer.connection.disconnected) {
      consumer.subscriptions.create({ channel: "ClassRoomChannel", class_room_id: messages.data('class-room-id') }, {
        connected() {
        },

        disconnected() {
          // Called when the subscription has been terminated by the server
        },

        received(data) {
          if ($('.no-messages').length > 0) {
            $('.no-messages').hide();
          }
          const element = document.getElementById("messages");
          element.insertAdjacentHTML("beforeend", data.html);
          this.messages_to_bottom();
        },

        messages_to_bottom() {
          messages.scrollTop(messages.prop("scrollHeight"))
        },
      })
    }

    messages.scrollTop(messages.prop("scrollHeight"));
  }
})