import flatpickr from "flatpickr";
import { Ukrainian } from "flatpickr/dist/l10n/uk.js"

addEventListener('turbolinks:load', function () {
  flatpickr("[data-provide='datepicker']", {
    allowInput: true,
    format: "Y-m-d",
    altFormat: "Y-m-d",
    altInput: true,
    "locale": Ukrainian,
    maxDate: new Date()
  })
});