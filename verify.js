function startup() {
    var account_number = $('[name=account_number]');
    var routing_number = $('[name=routing_number]');

    var button = $('<button type="button">Verify</button>');
    var result_text = $('<input name="bank_validation" type="text" disabled/>');

    account_number.after(button);
    account_number.after(result_text);

    button.click(function () {
        $.ajax({
                type: 'GET',
                url: 'http://localhost:8090/api/check-status/' + routing_number.val() + '/' + account_number.val() + '/1',
                dataType: "json",
                xhrFields: {
                    withCredentials: true
                }}
        ).done(function (data) {
                result_text.val(data.result)
            });
    });
}

//$(startup);
startup();
