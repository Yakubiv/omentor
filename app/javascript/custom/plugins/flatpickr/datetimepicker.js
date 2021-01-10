import flatpickr from "flatpickr";
import { Ukrainian } from "flatpickr/dist/l10n/uk.js"

var datePicker = function () {
  flatpickr("[data-provide='datepicker']", {
    allowInput: true,
    format: "Y-m-d H:i",
    altFormat: "Y-m-d H:i",
    altInput: true,
    enableTime: true,
    "locale": Ukrainian
  })
};

addEventListener('turbolinks:load', datePicker, false);