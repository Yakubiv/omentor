import "easy-autocomplete/dist/jquery.easy-autocomplete";

addEventListener("turbo:load", function () {
  var searchForm = $("#c-tutors-search-box");

  if (searchForm.length > 0) {
    var subjectInput = $("#search_tutor_subject");

    subjectInput.focus(function () {
      var e = jQuery.Event("keyup", { keyCode: 65, which: 65 });
      $(this).attr("value", "");
      $(this).triggerHandler(e);
      $(this).trigger("change");
    });

    var options = {
      url: function (name) {
        return `/api/v1/subjects.json?name=${name}&format=json`;
      },
      getValue: "name",
      list: {
        match: {
          enabled: true,
        },
      },
      theme: "square",
    };

    subjectInput.easyAutocomplete(options);
  }

  var tutorForm = $("#tutor_profile_subject");

  if (tutorForm.length > 0) {
    var subjectInput = $("#tutor_profile_subject");

    subjectInput.focus(function () {
      var e = jQuery.Event("keyup", { keyCode: 65, which: 65 });
      $(this).attr("value", "");
      $(this).triggerHandler(e);
      $(this).trigger("change");
    });

    var options = {
      url: function (name) {
        return `/api/v1/subjects.json?name=${name}&format=json`;
      },
      getValue: "name",
      list: {
        match: {
          enabled: true,
        },
      },
      theme: "square",
    };

    subjectInput.easyAutocomplete(options);
  }
});
