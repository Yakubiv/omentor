addEventListener("turbolinks:load", function () {
  let feedbackImageInput = document.getElementById("feedback-image-input");
  if (feedbackImageInput) {
    document
      .getElementById("feedback-image-input")
      .addEventListener("change", function () {
        let file_input = document.getElementById("feedback-image-input");
        let path_filename = file_input.value;
        let filename = path_filename.split(/(\\|\/)/g).pop();
        if (filename != "") {
          if (filename.length > 25) {
            filename = filename.slice(0, 25) + "...";
          }
          document.getElementById("feedback-file-name").innerText = filename;
        }
      });
  }
});
