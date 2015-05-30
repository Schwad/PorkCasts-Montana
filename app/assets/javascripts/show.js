var myGraphPause = false;

$(document).ready(function(){

  // graph hover
  $('.graph-hold').hover(function(e) {
    if(myGraphPause === false){
      console.log("x " + e.pageX);
      var x = e.pageX - 70;
      var y = e.pageY - 70;
      console.log("y " + e.pageY);
        $('.graph-popup').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
      myGraphPause = true;
    }
  }, function() {
      setTimeout(function(){
        $('.graph-popup').fadeOut(830, "swing");
      }, 1000);
      setTimeout(function(){ myGraphPause = false; }, 14000);
  });


});
