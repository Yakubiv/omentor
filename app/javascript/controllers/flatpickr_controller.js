import Flatpickr from "stimulus-flatpickr";
import { Ukrainian } from "flatpickr/dist/l10n/uk.js";
import "flatpickr/dist/themes/airbnb.css";

export default class extends Flatpickr {
  connect() {
    console.log('hihih');

    this.config = {
      ...this.config,
      altInput: true,
      allowInput: true,
      altInputClass: "",
      enableTime: true,
      locale: Ukrainian,
    };
    super.connect();
  }
}