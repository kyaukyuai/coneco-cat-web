$(function() {
  $(".img-favorite").click(function() {
    $(this).addClass("animated fadeOutUp");
    var that = this;
    var cat_id = $(this).val();
    var favorite_url = "/api/v1/favorites";
    $.ajax({
      url: favorite_url,
      type: 'POST',
      dataType: 'jsonp',
      data: {cat_id: cat_id},
      timeout: 10000,
      success: function() {
      },
      error: function() {
      }
    });
  });
  $(".img-good").on({
    "click":function(){
      $(this).addClass("animated fadeOutUp");
      var that = this;
      var cat_id = $(this).val();
      var good_url = "/api/v1/events/good";
      $.ajax({
        url: good_url,
        type: 'POST',
        dataType: 'jsonp',
        data: {cat_id: cat_id},
        timeout: 10000,
        success: function() {
        },
        error: function() {
        }
      });
    },
    "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend":function(){
    }
  });
  $(".img-bad").on({
    "click":function(){
      $(this).addClass("animated fadeOutUp");
      var that = this;
      var cat_id = $(this).val();
      var bad_url = "/api/v1/events/bad";
      $.ajax({
        url: bad_url,
        type: 'POST',
        dataType: 'jsonp',
        data: {cat_id: cat_id},
        timeout: 10000,
        success: function() {
        },
        error: function() {
        }
      });
    },
    "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend":function(){
    }
  });
});
