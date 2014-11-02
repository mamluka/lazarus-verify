function startup() {
    button = $('[name=verifyAccount]');

    button.click(function () {
        $.ajax({
                type: 'GET',
                url: 'http://localhost:8090/api/check-status/' + routing_number.val() + '/' + account_number.val() + '/1',
                dataType: "json",
                xhrFields: {
                    withCredentials: true
                }}
        ).done(function (data) {
                $('[namn=account_verify]').val(data.result)
            });
    });
}

//$(startup);
startup();
