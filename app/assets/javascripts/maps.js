$(document).on('turbolinks:load', function(){

  deploy_newmapform()

});


function deploy_newmapform() {
      $('.btn-new-map-js').on('click', function() {
            $('.form-new-map-js').fadeToggle(200) ;
      });
    };
