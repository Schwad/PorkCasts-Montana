var myGraphPause = false;
var myLinkPause = false;
var myTablePause = false;

$(document).ready(function(){

  // graph hover
  $('.graph-hold').hover(function(e) {
    if(myGraphPause === false){
      var x = e.pageX - 70;
      var y = e.pageY - 70;
      $('.graph-popup').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
      myGraphPause = true;
    }
  }, function() {
      setTimeout(function(){
      $('.graph-popup').fadeOut(830, "swing");
      }, 1000);
      setTimeout(function(){ myGraphPause = false; }, 30000);
  });

  // share hover

  $('.share-hold').hover(function(e) {
    if(myLinkPause === false){
      var x = e.pageX - 70;
      var y = e.pageY - 70;
      $('.share-link').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
      myLinkPause = true;
    }
  }, function() {
      setTimeout(function(){
        $('.share-link').fadeOut(830, "swing");
      }, 1000);
      setTimeout(function(){ myLinkPause = false; }, 30000);
  });

  // data table hover

  $('.data-table-hold').hover(function(e) {
    if(myTablePause === false){
      var x = e.pageX - 70;
      var y = e.pageY - 70;
      $('.table-time').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
      myTablePause = true;
      setTimeout(function(){
        $('.table-time').fadeOut(830, "swing");
      }, 1520);
      setTimeout(function(){ myTablePause = false; }, 30000);
    }
  }, function() {

  });


});
