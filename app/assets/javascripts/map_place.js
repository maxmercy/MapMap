$(document).on('ready', function() {

    listenEditComment()
    listenSubmitComment()
});


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
