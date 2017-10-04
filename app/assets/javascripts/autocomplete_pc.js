$(document).ready(function(){
  console.log('loaded');
  if($('#pc-autocomplete').length ==1){
    console.log('triggering 3');
    $('#pc-autocomplete').keyup(function () {
      console.log("event is: " + $(this).val());
      triggerSearch($(this).val());
    });
    $('#autocomplete-suggestion').click(function() {
      $("#pc-autocomplete").val($(".best-match strong")[0].innerHTML)
    })
  } else {
    console.log('wtf')
  }
});

var triggerSearch = function(term) {
  console.log('triggering 12');
  var request = $.ajax({
    url: "/autocomplete",
    method: "GET",
    data: { term: term },
    dataType: "json"
  });

  request.done(function( msg ) {
    $( "#autocomplete-suggestion" ).html('<div class=\'best-match\'>Best match: <strong>' + msg["result"] + '</strong></div>')
  });
}
