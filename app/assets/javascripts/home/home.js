console.log("home.js is working!")

$(document).ready(function()
{
  $(".yes").on("click", function(){
    console.log("click working")
  $(".intro1").hide()
  $(".intro2").show();
    });
  $(".no").on("click", function(){
    console.log("no click working")
  $(".intro1").hide()
  $(".intro2").show();
    });

})




