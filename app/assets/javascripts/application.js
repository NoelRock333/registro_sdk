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
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(document).ready(function() {
  $('.mark-as-attended').on('click', function() {
    $dataTag = $(this);
    var response = confirm('¿lo vas a marcar o desmarcar?');
    if (response) {
      // $dataTag.closest('.assistant-row').hasClass('attended')
      $.ajax({
        type: 'PUT',
        data: {
          authenticity_token: $('[name="csrf-token"]')[0].content
        },
        url: '/assistants/' + $dataTag.data('id') + '/mark',
        dataType: 'JSON'
      }).done(function(data) {
        console.log(data);
        if (data) {
          $dataTag.closest('.assistant-row').addClass('attended');
          $dataTag.html('Si');
        }
      });
    }
  });
});