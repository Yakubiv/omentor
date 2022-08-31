import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log('conected')
  }

  selectTime(event) {
    var startAt = event.target.dataset.bookingTime
    var checkbox = event.target.dataset.bookingCheckbox
    document.getElementById('lesson_start_at').value = startAt;
    if (checkbox) {
      let elements = document.getElementsByClassName("c-time-slot-record")
      for (var i = 0; i < elements.length; i++) {
        elements[i].classList.remove("active");
      };
      event.target.classList.add('active')
      document.getElementById('tutor-creates-lesson').disabled = false;
    }
    else {
      event.target.closest('form').submit();
    }
  }

  changeDuration(event) {
    var tutorRate = event.target.dataset.tutorRate;
    var lessonDuration = event.target.value;
    var price = ((tutorRate * lessonDuration) / 60.0) / 100;
    document.getElementById('lesson_price').value = price.toFixed(2).toString().replace('.', ',')
  }
}
