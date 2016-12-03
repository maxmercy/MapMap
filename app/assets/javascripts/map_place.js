$(document).on('ready', function() {

    listenEditComment()
    listenSubmitComment()
});


function listenEditComment() {
    $(".btn-field-toggler").click(function() {
        $(this).parent().children(".content-comment").toggle(120);
        $(this).parent().children(".form-edit-place").toggle(120);
    });
};

function listenSubmitComment() {
    var self = this;
    $(".form-edit-place").bind("submit", function(event) {
        event.preventDefault();
        var new_comment = $(this).children('textarea').val();
        var map_place_id = $(this).children('input').attr('id');
        if (new_comment) {
            console.log(this)
            update_comment(new_comment,map_place_id, $(this));
        }
    });
};

function update_comment(new_comment,map_place_id, form) {
      console.log(this)
        console.log(form)
     $.ajax({
        url: '/map_places/'+ map_place_id,
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
       $(form).parent().children(".content-comment").append(new_comment);
       $(form).parent().children(".content-comment").toggle(120);
};
