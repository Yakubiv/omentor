import Flatpickr from "stimulus-flatpickr";
import { Ukrainian } from "flatpickr/dist/l10n/uk.js";
import "flatpickr/dist/themes/airbnb.css";

export default class extends Flatpickr {
  connect() {
    this.config = {
      ...this.config,
      altInput: true,
      allowInput: true,
      altInputClass: "",
      enableTime: true,
      locale: Ukrainian,
      altFormat: "Y-m-d H:i",
      dateFormat: "Y-m-d H:i",
      minDate: "today",
    };
    super.connect();
  }
}
