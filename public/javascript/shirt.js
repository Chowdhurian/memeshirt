$(document).ready(function() {
  $("#shirt_button").click(function(){
    if ($('#shirt_button').val() === "Ladies") {
      $('.shirt-generator .shirt-illustration, #kluge').css('background', "url('/images/shirt_girl.png') top center no-repeat");
      $('.shirt-generator .shirt-illustration img').css('left', "47%");
      $('#shirt_button').val("Mens");
    }
    else {
      $('.shirt-generator .shirt-illustration, #kluge').css('background', "url('/images/shirt_guy.png') top center no-repeat");
      $('.shirt-generator .shirt-illustration img').css('left', "50%");
      $('#shirt_button').val("Ladies");
    }
  });
});

