$(document).on('click', '.add_talk_fields', function(event) {
    console.log("add talk field!!")
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.talk-fields').append($(this).data('fields').replace(regexp, time));
    if ($('div:visible.talk-field').length >= 3) {
        $('.add-talk').hide()
    }
    return event.preventDefault();
})

$(document).on('click', '.remove_talk_field', function(event) {
    console.log("remove talk field!!")
    $(this).parent().find('.destroy_flag_field').val(1)
    $(this).closest('.talk-field').hide();
    $(this).parent().find('input').removeAttr('required max min maxlength pattern');
    $(this).parent().find('textarea').removeAttr('required max min maxlength pattern');
    $(this).parent().find('select').removeAttr('required max min maxlength pattern');
    if ($('div:visible.talk-field').length < 3) {
        $('.add-talk').show()
    }
    return event.preventDefault();
});
