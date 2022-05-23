// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// jquery
import jquery from "jquery";
window.$ = jquery;

// jquery code
$(function () {
  $(".alert, .notice").fadeOut(3500);
});
