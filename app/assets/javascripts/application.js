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
//= require turbolinks
//= require jquery
//= require_tree .

$(document).ready(function(){
  $('#btn-send').click(function(event) {
    event.preventDefault();
    var value = $('.input').val();
    var count = $('.count').val();
    var desctibtion = $('.describe');
    $.ajax({
      type:'POST',
      url:'/remote',
      data: { remote: { body: value } },
      beforeSend: beforeSend,
      dataType: 'json',
      success: function (data) {
        $('.side-time').append(
          '<p>' + data.date + '</p>'
        );
        $('.count').text(x => count + 1);
      }
    })
  })
})

function beforeSend(xhr) {
  xhr.setRequestHeader('X-CSRF-Token',
    $('meta[name="csrf-token"]').attr('content')
  )
}
