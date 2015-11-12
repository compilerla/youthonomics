// country page js

$(document).ready(function(){
  console.log('running in the application javascript folder');
  $(function() {
    $('ul.navbar-nav.nav li').removeClass('active');
    console.log(location.pathname.split("/")[1]);
    $('nav a[href^="/' + location.pathname.split("/")[1] + '"]').parent('li').addClass('active');
  });
  $('body').addClass('js');
  $('.blog-panel, .social-media-panel, .action-panel').mouseover(function(){
    var cta = $(this).find('.check-it-cta');
    cta.removeClass('fadeOutLeft');
    cta.addClass('fadeInLeft');
  });
  $('.blog-panel, .social-media-panel, .action-panel').mouseleave(function(){
    var cta = $(this).find('.check-it-cta');
    cta.removeClass('fadeInLeft');
    cta.addClass('fadeOutLeft');
  });

  $('.subindex').on("click", function() {
    event.preventDefault();
    $('.subindex-pillar').removeClass('active');
    var subindex = $(this).attr('id');
    var pillar = $('[data-subindex="' + subindex + '"]');
    var pillarHeight = $(pillar.height());
    pillar.addClass('active');
    $(pillar).parent('.pillar-container');
  });

});
