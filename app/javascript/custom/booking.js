addEventListener('turbolinks:load', function () {
  var bookingCalendarEl = document.getElementById('booking-calendar');
  if (bookingCalendarEl) {
    $('.c-time-slot-record').on('click', function(e) {
      var startAt = $(this).data('time');
      var checkbox = $(this).data('checkbox');
      $('#lesson_start_at').attr('value', startAt);
      if(checkbox) {
        $('.c-time-slot-record').removeClass('active');
        $(this).addClass('active');
      }
      else {
        $(this).closest('form').submit();
      }
    });
  }

  var lessonDuration = $('#lesson_duration');

  if (lessonDuration.length > 0) {
    lessonDuration.on('change', function (e) {
      var tutorRate = parseFloat($(this).attr('data-tutor-rate'));
      var lessonDuration = parseFloat($(this).val());
      var price = ((tutorRate * lessonDuration) / 60.0) / 100;
      $('#lesson_price').val(price.toFixed(2).toString().replace('.', ','))
    });
  }
});
