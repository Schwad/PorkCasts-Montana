// var myGraphPause = false;
// var myLinkPause = false;
// var myTablePause = false;
// var hoverEngage = false;
// var myDonatePause = false;
//
// $(document).ready(function(){
//
//   //donate hover
//
//   $('.donate-link').hover(function(e) {
//     if(myDonatePause === false && hoverEngage === false){
//       var x = e.pageX;
//       var y = e.pageY;
//       myDonatePause = true;
//       hoverEngage = true;
//       $('.donate-time').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
//     }
//   }, function() {
//       setTimeout(function(){
//         $('.donate-time').fadeOut(1830, "swing");
//       }, 1000);
//       setTimeout(function(){ myDonatePause = false; }, 30000);
//       setTimeout(function(){ hoverEngage = false; }, 1000);
//   });
//
//   // graph hover
//   $('.graph-hold').hover(function(e) {
//     if(myGraphPause === false && hoverEngage === false){
//       var x = e.pageX - 70;
//       var y = e.pageY - 70;
//       myGraphPause = true;
//       hoverEngage = true;
//       $('.graph-popup').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
//
//     }
//   }, function() {
//       setTimeout(function(){
//       $('.graph-popup').fadeOut(830, "swing");
//       }, 1000);
//       setTimeout(function(){ myGraphPause = false; }, 30000);
//       setTimeout(function(){ hoverEngage = false; }, 1830);
//   });
//
//   // share hover
//
//   $('.share-hold').hover(function(e) {
//     if(myLinkPause === false && hoverEngage === false){
//       var x = e.pageX - 70;
//       var y = e.pageY - 70;
//       myLinkPause = true;
//       hoverEngage = true;
//       $('.share-link').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
//     }
//   }, function() {
//       setTimeout(function(){
//         $('.share-link').fadeOut(830, "swing");
//       }, 1000);
//       setTimeout(function(){ myLinkPause = false; }, 30000);
//       setTimeout(function(){ hoverEngage = false; }, 1830);
//   });
//
//   // data table hover
//
//   $('.data-table-hold').hover(function(e) {
//     if(myTablePause === false && hoverEngage === false){
//       var x = e.pageX - 70;
//       var y = e.pageY - 70;
//       myTablePause = true;
//       hoverEngage = true;
//       $('.table-time').fadeIn(520, "swing").css({"margin-left": x, "margin-top": y});
//
//       setTimeout(function(){
//         $('.table-time').fadeOut(830, "swing");
//       }, 1520);
//       setTimeout(function(){ myTablePause = false; }, 30000);
//       setTimeout(function(){ hoverEngage = false; }, 2350);
//     }
//   }, function() {
//
//   });
//
//
// });
