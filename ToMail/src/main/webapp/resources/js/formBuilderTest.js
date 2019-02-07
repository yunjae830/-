$(document).ready(function () {
    $(".form_bal_textfield").draggable({	//드래그함
        helper: function () {				//드래그 중 사용할 함수
            return getTextFieldHTML();
        },
        connectToSortable: ".form_builder_area"
    });
    
    
    function getTextFieldHTML() {
        var field = generateField();
        var html = '<div class="all_div"><div class="row li_row"><div class="col-md-12" style="text-align : center;"><strong>Text</strong><button type="button" class="btn btn-primary btn-sm remove_bal_field pull-right" data-field="' + field + '"><i class="fa fa-times"></i></button></div></div></div><hr/><div class="row li_row form_output" data-type="text" data-field="' + field + '"><div class="col-md-12"><div class="form-group"><input type="text" name="label_' + field + '" class="form-control form_input_label" value="form-control" placeholder="Class" data-field="' + field + '"/></div></div><div class="col-md-12"><div class="form-group"><input type="text" name="placeholder_' + field + '" data-field="' + field + '" class="form-control form_input_placeholder" placeholder="Placeholder"/></div></div><div class="col-md-12"><div class="form-group"><input type="text" name="text_' + field + '" class="form-control form_input_name" placeholder="Name"/></div></div><div class="col-md-12"><div class="form-check"><label class="form-check-label"><input data-field="' + field + '" type="checkbox" class="form-check-input form_input_req">Required</label></div></div></div>';
        return $('<div>').addClass('li_' + field + ' form_builder_field').html(html);
    }
    
    function generateField() {
        return Math.floor(Math.random() * (100000 - 1 + 1) + 57);
    }
    
    function getPreview(plain_html = '') {
        var el = $('.form_builder_area .form_output');
        var html = '';
        el.each(function () {
            var data_type = $(this).attr('data-type');
            //var field = $(this).attr('data-field');
            var label = $(this).find('.form_input_label').val();
            var name = $(this).find('.form_input_name').val();
            if (data_type === 'text') {
                var placeholder = $(this).find('.form_input_placeholder').val();
                var checkbox = $(this).find('.form-check-input');
                var required = '';
                if (checkbox.is(':checked')) {
                    required = 'required';
                }
                html += '<input type="text" name="' + name + '" placeholder="' + placeholder + '" class="'+label+'" ' + required + '/>';
            }
        
            
            if (html.length) {					//버튼을 보여주게하고(html이 길이가 있으면)
                $('.export_html').show();
            }
        });
    }

});// end $(document).ready(function(){})

