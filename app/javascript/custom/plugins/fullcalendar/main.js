import { Calendar } from '@fullcalendar/core';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';

addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar-registration-form');
  var calendar = new Calendar(calendarEl, {
    selectable: true,
    header: {
      left: 'prev,next',
      center: 'title',
      right: ''
    },
    defaultView: 'timeGridWeek',
    allDaySlot: false,
    editable: true,
    plugins: [interactionPlugin, timeGridPlugin],
    events: '/t/registrations/time_slots.json',
    select: function (info) {
      var timeSlot = {
        time_slot: {
          start_at: info.start,
          end_at: info.end
        }
      }

      $.ajax({
        url: "/t/registrations/time_slots.js",
        type: "POST",
        data: timeSlot,
        success: function (data) {

        }
      })
    },
    eventClick: function (event, jsEvent, view) {
      $.getScript(event.edit_url, function () { });
    }
  });

  calendar.render();
});