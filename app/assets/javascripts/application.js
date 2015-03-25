// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

$(function() {
  $("#books_search input").keyup(function() {
    $.get($("#books_search").attr("action"), $("#books_search").serialize(), null, "script");
    return false;
  });

  $('#books_div th a, #books_div .pagination a').live('click', 
    function () {
      $.getScript(this.href);
      return false;
    }
  );

  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });

  $('#users_div th a, #users_div .pagination a').live('click', 
    function () {
      $.getScript(this.href);
      return false;
    }
  );

  $("#categories_search input").keyup(function() {
    $.get($("#categories_search").attr("action"), $("#categories_search").serialize(), null, "script");
    return false;
  });

  $('#categories_div th a, #categories_div .pagination a').live('click', 
    function () {
      $.getScript(this.href);
      return false;
    }
  );
});