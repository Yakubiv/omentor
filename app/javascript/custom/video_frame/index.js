addEventListener("turbolinks:load", function () {
  function getId(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

    if (match && match[2].length == 11) {
      return match[2];
    } else {
      return "error";
    }
  }

  function setDataToFrame(urlValue) {
    let videoFrame = document.getElementById("video-frame");

    if (urlValue) {
      videoFrame.className = "block absolute";
      let myId = getId(urlValue);
      videoFrame.src = "//www.youtube.com/embed/" + myId;
    } else {
      videoFrame.className = "hidden";
    }
  }

  let videoUrl = document.getElementById("video-url");
  if (videoUrl) {
    setDataToFrame(videoUrl.value);
    videoUrl.oninput = function (event) {
      setDataToFrame(event.target.value);
    };
  }
});
