import flatpickr from "flatpickr";

addEventListener('turbolinks:load', function () {
  console.log('hi')
  flatpickr("[data-provide='datepicker']", {
    allowInput: true,
    dateFormat: "Y-m-d",
    maxDate: new Date()
  })
});