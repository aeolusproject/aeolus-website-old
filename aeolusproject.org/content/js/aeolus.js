function positionFooter() {
  var $footer = $('#footer');
  $footer.removeClass('fixed');
  if ($(document.body).height() < $(window).height()) {
    $footer.addClass('fixed');
  } else {
    $footer.removeClass('fixed');
  }
}

$(document).ready(function () {
  $(window).scroll(positionFooter).resize(positionFooter).scroll();
  //chrome seems to ignore the scroll event the first time on the about page
  setTimeout(positionFooter,200);
   //preventFOUT();
});
