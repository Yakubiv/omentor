import flatpickr from "flatpickr";
import { Ukrainian } from "flatpickr/dist/l10n/uk.js"

addEventListener('turbolinks:load', function () {
  flatpickr("[data-provide='datepicker']", {
    allowInput: true,
    dateFormat: "Y-m-d",
    "locale": Ukrainian,
    maxDate: new Date()
  })
});