import consumer from "./consumer"

addEventListener('turbolinks:load', function () {
  var messages = $('#messages');

  if (messages) {
    consumer.subscriptions.create({ channel: "ClassRoomChannel", class_room_id: messages.data('class-room-id') }, {
      connected() {
        // Called when the subscription is ready for use on the server
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

    messages.scrollTop(messages.prop("scrollHeight"));
  }
})