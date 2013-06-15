
$(document).ready(function () {
    var $questionField = $('#questionField');
    var $form = $('form#myForm');
    var i = $('#myForm input').size() + 1;
    var j = $('#questionField div').size();
    var z = 100;
    
    
    
    $('form').on('click', 'a.addField', function (e) {
        e.preventDefault();
        var field = '<p><label>Choice<label><input type="text" name="post[cnew' + i +']" placeholder="choice"/><a href="#" class="removeField">delete this choice</a></p>';
        $(this).closest('.question').append(field);
        i++;
        console.log(z);
        return false;
    });

    $('form').on('click', 'a.removeField', function (e) {
        e.preventDefault();
        $(this).parent().parent().remove();
        return false;
    });

    $('a.addQuestion').on('click', function (e) {
        e.preventDefault();
        var question = '<div class="question"><p><label>Question<label><textarea rows="5" cols="50" name="post[qnew' + i + ']"></textarea></p><a href="#" class="removeQuestion" >Remove Question!</a><a href="#" class="addField" >Add choice!</a> <p><label>Choice<label><input type="text" name="post[cnew' + i + ']" placeholder="choice"></p></div>'
        // $('#sub_form').remove();
        
        $(question).appendTo($questionField);
        i++;
        j++;
        z--;
        return false;
    });

    $('form').on('click', 'a.removeQuestion', function (e) {
        e.preventDefault();
        if (j > 1) {
            $(this).closest('.question').remove();
            j--;
        }
        return false;
    });

    $('sub_form').on('submit', function(e){
      e.preventDefault();
      var data = $(this).serialize();
      $.post('/create', data, function(response){
        console.log(response);
      });
    });


});
