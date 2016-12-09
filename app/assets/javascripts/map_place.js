$(document).on('ready', function() {
    focus_map_place_click()
    listenEditComment()
    listenSubmitComment()
    editcategory_sprite()
});


function focus_map_place_click() {
  $('body').on('click',".box-map-place", function() {
      $('.box-map-place').removeClass('box-map-place-focus')
      $(this).addClass('box-map-place-focus')
});
};


function listenEditComment() {
    $('.show-place-info').on('click',".btn-field-toggler", function() {
        $(this).parent().children(".content-comment").toggle(120);
        $(this).parent().children(".form-edit-place").toggle(120);

    });

};


function listenSubmitComment() {
    $('body').on('click',".btn-submit-comment", function(event) {
    // $(".form-edit-place").bind("submit", function(event) {
        event.preventDefault();
        var new_comment = $(this).parent().children('textarea').val();
        var map_and_map_place_id = $(this).parent().children('input').attr('id');
        update_comment(new_comment,map_and_map_place_id, $(this).parent());
    });
};


function update_comment(new_comment,map_and_map_place_id, form) {
      var arr = map_and_map_place_id.split('&');
      var map_id = arr[0];
      var map_place_id = arr[1];
     $.ajax({
        url: '/maps/'+ map_id  + '/map_places/'+ map_place_id,
        type: "patch",
        data: {comment: new_comment},
        success: updateComment(new_comment,form) ,
        error: function() {
            console.log("Update comment failed");
        }
    });
};



function updateComment(new_comment,form) {
       $(form).toggle(120);
       $(form).parent().children(".content-comment").empty();
       if (new_comment){
       $(form).parent().children(".content-comment").append(new_comment);
       }else {
      $(form).parent().children(".content-comment").append('You did not add any comment.');
       }
       $(form).parent().children(".content-comment").toggle(120);
};



function editcategory_sprite() {
    $('.show-place-info').on('click',".choice-sprite-category-list div", function() {
        var sprite_id = this.dataset.spriteid;
        var map_place_id = $(this).parent()[0].dataset.mapplaceid
        var map_id = $(this).parent()[0].dataset.mapid
        $.ajax({
           url: '/maps/'+ map_id  + '/map_places/'+ map_place_id,
           type: "patch",
           data: {sprite_number: sprite_id},
           success: updatespritemapplace(sprite_id, map_place_id) ,
           error: function() {
               console.log("Update comment failed");
           }
       });
    });
}


function updatespritemapplace(sprite_id, map_place_id) {
    $('#sprite-choice-map-place-'+map_place_id).modal('toggle');
  $('#sprite-display-map-place-'+map_place_id+' ').removeClass()
  $('#sprite-display-map-place-'+map_place_id+' ').addClass('sprite_category  sprite_category-'+sprite_id, 1500, "easeInOutQuad")

var index
var marker_link
    for ( var i = 0 ; i < markers.length; i++) {
      if (markers[i].store_id == map_place_id) {
        marker_link = markers[i];
        index = i
        markers[i].stripe_id = sprite_id
        break
      }
    }

    var stripe_position = ((stripe_id * 45)-45)
    var iconmarker = {
        url: '/assets/categorypin.svg',
        origin: new google.maps.Point(stripe_position, 0),
        size: new google.maps.Size(45,67),
        scaledSize: new google.maps.Size(720, 67)
    };

   markers[index].setMap(null);
   markers[index].setMap(map);

console.log(marker_link)





  // if (index > -1) {
  //     array.splice(index, 1);
  // }

    // createInitialMarker()

}


// $('#mainimage').click(function(e)
// {
//     var offset_t = $(this).offset().top - $(window).scrollTop();
//     var offset_l = $(this).offset().left - $(window).scrollLeft();
//
//     var left = Math.round( (e.clientX - offset_l) );
//     var top = Math.round( (e.clientY - offset_t) );
//
//     alert("Left: " + left + " Top: " + top);
//
// });
