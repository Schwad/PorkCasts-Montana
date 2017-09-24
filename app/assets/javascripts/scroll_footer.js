var ScrollDetector = function()
{
    "use strict";

  window.addEventListener( 'scroll', function() {
      if( window.scrollY < 50 && $('body#landing-page').length != 1)
      {
          document.body.classList.remove( 'scrolled' );
      } else {
          document.body.classList.add( 'scrolled' );
      }
  });
};

new ScrollDetector();
