// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require materialize-sprockets


$(document).on('turbolinks:load', onLoad);

function onLoad(){
  // alert ("document ready!!");
  $('select').material_select();
  $('.dropdown-button').dropdown({
    inDuration: 300,
    outDuration: 225,
    constrainWidth: true, // Does not change width of dropdown to that of the activator
    hover: true, // Activate on hover
    gutter: 0, // Spacing from edge
    belowOrigin: true, // Displays dropdown below the button
    alignment: 'left', // Displays dropdown with edge aligned to the left of button
    stopPropagation: false // Stops event propagation
  });

  $("#check_availability").click(function(){
    var club_id = $("#booking_club_id").val();
    var user_id = $("#booking_user_id").val();
    var booking_day = $("#booking_day").val();
    var booking_slot = $("#booking_time_slot").val();

    if (club_id == '' || booking_day == '' || booking_slot == ''){
      Materialize.toast("Please fill in all details", 2000, "red");
      return false;
    }

    $.ajax({
      method: "post",
      url: '/check_availability',
      data: {
        user_id: user_id,
        club_id: club_id,
        day: booking_day,
        time_slot: booking_slot
      },
      dataType: "json",
      success: function(response){
        // console.log(response);
        Materialize.toast(response.message, 2000, "blue");
      },
      error: function(error){
        // console.log(error);
        Materialize.toast(error.responseJSON.message, 2000, "red");
      }
    })
  });

  $(".delete_booking").click(function(){
    var booking_id = $(this).attr("data-booking-id");
    $.ajax({
      method: "delete",
      url: "/booking/" + booking_id,
      dataType: "json",
      success: function(response){
        location.reload();
      },
      error: function(error){
        Materialize.toast(error.responseJSON.message, 2000, "red");
      }
    })

  });

}
