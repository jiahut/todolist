// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var $modal = $('#task-new-modal');

$('#task-new-btn').on('click', function(){
  // create the backdrop and wait for next modal to be triggered
  $('body').modalmanager('loading');

  setTimeout(function(){
    $modal.load('/tasks/new', '', function(){
      $modal.modal();
    });
  }, 100);
});

$(".task-edit-btn").on("click",function(){
	$('body').modalmanager('loading');
  var id  = $(this).data("task-id"),
      url = "/tasks/" + id + "/edit";
	setTimeout(function(){
    $modal.load(url, '', function(){
      $modal.modal();
    });
  }, 100);
});

$(".task-destroy-btn").on("click",function(){
  var $self = $(this);
  $('body').modalmanager('loading');
  var id  = $(this).data("task-id"),
      url = "/tasks/" + id;
    $.ajax({
      cache: true,
      type: "DELETE",
      url: url,
      async: true
    }).done(function(){
      $('body').modalmanager('removeLoading');
      $self.parents('tr').remove();
    });
});