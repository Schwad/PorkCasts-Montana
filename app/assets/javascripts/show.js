var NavSetter = function()
{
    "use strict";
  window.onload = function(){
    if($('#main-landing-page').length ==0)
    {
        document.body.classList.add( 'scrolled' );
        var elem = document.getElementById("mainNav");
        elem.style="background-color:black;border-bottom:none;"
    }
  };
};

new NavSetter();
