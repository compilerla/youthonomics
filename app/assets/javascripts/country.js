// country page js

$(document).ready(function(){
  console.log('running in the application javascript folder');
  // $.ajax({
  //   type: "GET",
  //   url: "/country",
  //   dataType: "json",
  //   success: function(data){
  //       console.log(data) // log it
  //   }
  // });
  $('body').addClass('js');
  $('.blog-panel').mouseover(function(){
    var cta = $(this).find('.check-it-cta');
    console.log(cta);
    cta.removeClass('fadeOutLeft');
    cta.addClass('fadeInLeft');
  });
  $('.blog-panel').mouseleave(function(){
    var cta = $(this).find('.check-it-cta');
    console.log(cta);
    cta.removeClass('fadeInLeft');
    cta.addClass('fadeOutLeft');
  });
});
