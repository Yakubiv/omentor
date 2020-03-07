addEventListener('turbolinks:load', function () {
  $('a[data-popup]').on('click', function (e) {
    window.open($(this).attr('href'), "Popup", "fullscreen=yes, scrollbars=auto");
    e.preventDefault();
  });
});