import consumer from "./consumer"

document.addEventListener("DOMContentLoaded", function () {
  var messages = document.getElementById('messages');

  if (messages) {
    consumer.subscriptions.create({ channel: "ClassRoomChannel", class_room_id: messages.getAttribute('data-class-room-id') }, {
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
        element.scrollTop = element.scrollHeight;
        if (!data.is_owner) {
          var audio = new Audio();
          audio.src = '/audios/message.mp3';
          var playedPromise = audio.play();
          if (playedPromise) {
            playedPromise.catch((e) => {
              console.log(e)
              if (e.name === 'NotAllowedError' || e.name === 'NotSupportedError') {
                console.log(e.name);
              }
            }).then(() => {

            });
          }
        }
      }
    })

    const element = document.getElementById("messages");
    element.scrollTop = element.scrollHeight;

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
});

addEventListener('turbolinks:load', function () {
  const element = document.getElementById("messages");
  if (element) {
    element.scrollTop = element.scrollHeight;
  }
});