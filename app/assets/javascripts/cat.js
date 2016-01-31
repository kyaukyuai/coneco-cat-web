jQuery(function($){
  $("img.lazy").lazyload({
    effect: 'fadeIn',
    effectspeed: 1500,
    threshold: 300
  });
});
