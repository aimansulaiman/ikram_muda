$(window).load(function () {
    console.log('haha')
    if ($("#register_new_customer")) {

        $("#umrah_customer_customer_name")
            .keyup(function () {
                var value = $(this).val();
                var is_name_filled = value.length > 0
                var is_phone_number_filled = $("#customer_phone_number").val()

                var is_compulsory_form_filled = is_phone_number_filled && is_name_filled

                if (is_compulsory_form_filled) {
                    $("#register_new_customer").attr('disabled', false);
                } else {
                    $("#register_new_customer").attr('disabled', true);
                }
            })
            .keyup();

        $("#customer_phone_number")
            .keyup(function () {
                var value = $(this).val();

                var is_numbers_filled = value.length > 0
                var is_numbers_only = value.match(/^[0-9]+[0-9]*$/)

                if (is_numbers_only) {
                    $("#update_phone_error_message").text("")
                    $("#register_new_customer").attr('disabled', false);
                } else {
                    $("#register_new_customer").attr('disabled', true);

                    if (is_numbers_filled) {
                        $("#update_phone_error_message").text("Please enter a valid phone number")
                    }
                }
            })
            .keyup();
    }
});
