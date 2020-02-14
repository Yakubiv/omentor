addEventListener('turbolinks:load', function () {
  var bookingCalendarEl = document.getElementById('booking-calendar');
  if (bookingCalendarEl) {
    $('.c-time-slot-record').on('click', function(e) {
      var startAt = $(this).data('time');
      $('#lesson_start_at').attr('value', startAt);
      $(this).closest('form').submit();
    });
  }
});
