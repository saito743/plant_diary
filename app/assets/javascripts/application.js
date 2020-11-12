// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
// require_tree .
//= require jquery3
//= require jquery
//= require rails-ujs
//= require jquery.raty
//= require popper
//= require bootstrap-sprockets

//　ハンバーガーメニュー
$(function(){
  $('.menu-trigger').on('click',function(event){
  	$(this).toggleClass('active');
  	$('.sp-menu').fadeToggle();
  	event.preventDefault();
  });
});
//トップページ　スライド
$(function() {
  $('.main-visual').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    fade: true,
    infinite: true,
  });
});
//flashメッセージフェードアウト
$(function(){
  $('.flash').fadeOut(3000);
});
//アニメーション（下から）
$(function(){
  $(window).on('load scroll',function (){
    $('.animation-bottom').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active-bottom');
      }
    });
  });
});
//アニメーション（右から）
$(function(){
  $(window).on('load scroll',function (){
    $('.animation-rigth').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active-rigth');
      }
    });
  });
});
//アニメーション（左から）
$(function(){
  $(window).on('load scroll',function (){
    $('.animation-left').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active-left');
      }
    });
  });
});

//フッター　画面最下部で表示
$