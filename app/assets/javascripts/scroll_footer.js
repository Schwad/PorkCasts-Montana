var ScrollDetector = function()
{
    "use strict";

  window.addEventListener( 'scroll', function() {
      if( window.scrollY < 50 && $('#main-landing-page').length !=0)
      {
          document.body.classList.remove( 'scrolled' );
          var elem = document.getElementById("mainNav");
          elem.style="background-color:transparent;border-bottom:none;"
      } else {
          document.body.classList.add( 'scrolled' );
          var elem = document.getElementById("mainNav");
          elem.style="background-color:black;border-bottom:none;"
      }
  });
};

new ScrollDetector();
