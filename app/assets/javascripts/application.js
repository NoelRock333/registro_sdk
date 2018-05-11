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
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets

Pusher.logToConsole = true;
var pusher = new Pusher('d06a8153ce6dd021ea62', {
  cluster: 'us2',
  encrypted: true
});

var channel = pusher.subscribe('my-channel');
channel.bind('my-event', function(data) {
  var assistant = JSON.parse(data.assistant);
  var $assistant = $('#assistant_'+assistant.id);
  if (assistant.attended) {
    $assistant.addClass('attended');
    $assistant.find('.mark-as-attended').html('Si');
  } else {
    $assistant.removeClass('attended');
    $assistant.find('.mark-as-attended').html('No :(');
  }
});

$(document).ready(function() {
  $.getScript("http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js", function() {
    var t = $('#assistants-table').DataTable({
      pageLength: 100
    });
  });

  $('.mark-as-attended').on('click', function() {
    var id = $(this).data('id');
    var attended = $(this).closest('.assistant-row').hasClass('attended');
    var response = confirm('¿lo vas a marcar o desmarcar?');
    if (response) {
      $.ajax({
        type: 'PUT',
        data: {
          authenticity_token: $('[name="csrf-token"]')[0].content,
          attended: !JSON.parse(attended)
        },
        url: '/assistants/' + id + '/mark',
        dataType: 'JSON'
      }).fail(function() {
        alert('Algo salió mal');
      });
    }
  });

  // $('body').on('click', '.modal-link', function(ev) {
  //   ev.preventDefault();
  //   var $urlTag = $(this);
  //   var $myModal = $('#exampleModal');
  //   $myModal.modal('show');
  //   $myModal.find('.modal-body').empty();
  //   $.ajax({
  //     url: $urlTag.attr('href'),
  //     method: 'GET',
  //     dataType: 'HTML'
  //   }).done(function(data) {
  //     $myModal.find('.modal-title').html($urlTag.data('title'));
  //     $myModal.find('.modal-body').html(data);
  //   });
  // });
});