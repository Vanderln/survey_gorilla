$(document).ready(function () {
    var $questionField = $('#questionField');
    var $form = $('form#myForm');
    var $inputElements = $('#myForm input').size();
    var $questionElements = $('#questionField textarea').size();
    
    $('form').on('click', 'a.addField', function(e) {
        e.preventDefault();
        var field = '<p><label>Choice<label><input type="text" name="choice '+ $inputElements +'" placeholder="choice"/><a href="#" class="removeField">delete this choice</a></p>';
        $(this).closest('.question').append(field);
        $inputElements++;
        return false;
    });

    $('form').on('click', 'a.removeField', function(e) {
        e.preventDefault();
        $(this).closest('p').remove();
        $inputElements--;
        return false;
    });

    $('a.addQuestion').on('click', function(e) {
        e.preventDefault();
        var question = '<div class="question"><p><label>Question<label><textarea rows="5" cols="50" name="question'+ $inputElements +' "></textarea></p><a href="#" class="removeQuestion" >Remove Question!</a><a href="#" class="addField" >Add choice!</a></div>'
        $(question).appendTo($questionField);
        $questionElements++;
        return false;
    });

    $('form').on('click', 'a.removeQuestion', function(e) {
        e.preventDefault();
        $(this).closest('.question').remove();
        $questionElements--;
        return false;
    });

    $('form#myForm').on('submit', function(e) {
      if ($questionElements >= 1 && $inputElements >= 4) {
        var data = $(this).serialize();
        $.post('/create', data );
      } else { 
        e.preventDefault();
        alert('Surveys must have at least 1 question and 2 choices!') 
      }
    });


});
