import consumer from "./consumer"

document.addEventListener("DOMContentLoaded", function () {
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

    $(document).on('keypress', '[data-behavior=room_speaker]', function (event) {
      if (event.keyCode === 13) {
        var postData = {
          message: {
            profile_id: $('#message_profile_id').val(),
            body: event.target.value
          }
        }
        $.ajax({
          url: `/class_rooms/${messages.data('class-room-id')}/messages`,
          type: "POST",
          data: postData,
          success: function (data, textStatus, jqXHR) {
          },
          error: function (jqXHR, textStatus, errorThrown) {
          }
        });
        event.target.value = '';
        $(this).focus()
        event.preventDefault();
      }
    });
  }
})