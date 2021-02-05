import { Calendar } from "@fullcalendar/core";
import timeGridPlugin from "@fullcalendar/timegrid";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";

addEventListener("turbo:load", function () {
  var calendarEl = document.getElementById("tutor-calendar");
  if (calendarEl && calendarEl.classList.contains("fc")) {
    $("#tutor-calendar").html("");
  }
});

addEventListener("turbo:load", function () {
  var calendarEl = document.getElementById("tutor-calendar");
  if (calendarEl) {
    var calendar = new Calendar(calendarEl, {
      selectable: true,
      headerToolbar: {
        left: "prev,next title",
        center: "",
        right: "dayGridMonth,timeGridWeek,timeGridDay",
      },
      initialView: "timeGridWeek",
      allDaySlot: false,
      nowIndicator: true,
      slotLabelFormat: [
        {
          hour: "numeric",
          minute: "2-digit",
          meridiem: "short",
          hour12: false,
        },
      ],
      eventTimeFormat: {
        // like '14:30:00'
        hour: "2-digit",
        minute: "2-digit",
        meridiem: false,
        hour12: false,
      },
      selectInfo: {
        start: "00:01",
        end: "23:59",
      },
      selectConstraint: {
        startTime: "00:00",
        endTime: "23:00",
      },
      businessHours: {
        startTime: "8:00",
        endTime: "24:00",
        daysOfWeek: [0, 1, 2, 3, 4, 5, 6],
      },
      firstDay: 1,
      selectOverlap: false,
      slotDuration: "01:00:00",
      plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin],
      events: "/t/calendars.json",

      eventClick: function (info) {
        $.ajax({
          url: `/t/calendars/${info.event.id}/edit.js?type=${info.event._def.extendedProps.type}`,
          type: "GET",
        });
      },

      select: function (info) {
        console.log(info);
        $.ajax({
          url:
            "/t/calendars/new.js" +
            `?start_at=${info.startStr}&end_at=${info.endStr}`,
          type: "GET",
        });
      },
    });

    window.calendar = calendar;

    calendar.render();
  }
});
