import Flatpickr from "stimulus-flatpickr";
import "flatpickr/dist/themes/airbnb.css";

export default class extends Flatpickr {
  connect() {
    this.config = {
      ...this.config,
      altInput: true,
      altInputClass: "",
      altFormat: "D, M j, Y"
    };

    super.connect();
  }
}