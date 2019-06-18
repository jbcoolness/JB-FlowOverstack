$(document).ready(function() {
    // $('#show-comments-question').ccs('display', 'none');
    
    $('[data-js-show-link]').click(function(event){
      $('#show-comments-question').slideToggle(1000);
      event.preventDefault(); 
    });

    $('[data-js-show-question-comments-link]').click(function(event){
        $('#show-commnents-answer').slideToggle(1000);
        event.preventDefault(); 
    });
});