function positionFooter() {
  var $footer = $('#footer');
  if ($(document.body).height() < $(window).height()) {
    $footer.addClass('fixed');
  } else {
    $footer.removeClass('fixed');
  }
}

$(document).ready(function () {
  $(window).scroll(positionFooter).resize(positionFooter).scroll();
});
