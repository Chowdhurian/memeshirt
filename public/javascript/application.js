$(document).ready(function() {

  $("#generate-shirt").click(function(){
    $.ajax({
      url: "/new_meme", 
      success: function(data){
        $(".meme").attr("src", data["meme_url"]);
    }});
  });
});
