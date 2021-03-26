$('#them-tac-gia').on('click', (e) => {
    $('.modal-custom').removeClass('hide');
    $('#save-tac-gia').addClass('store');
    $('#save-tac-gia').html('Thêm');
    $('#ten-tac-gia').val('');
     
});

$('#dong-form-tac-gia').on('click', (e) => {
    $('.modal-custom').addClass('hide');
});

$('#save-tac-gia').on('click', (e) => {
    let url = '/admin/tac-gia/store';
    let id  = 0;
    if ($('#save-tac-gia').hasClass('update')) {
        id = $('#save-tac-gia').prop('name').split('-')[1];
        url = `/admin/tac-gia/update/${id}`;
    }
    $.ajax(
        {
            url: url,
            data: {
                tenTacGia: $('#ten-tac-gia').val()
            },
            method: 'POST'
        }
    ).done((e) => {
        if (e.complete){
            toastr.success(e.mess);
            if ($('#save-tac-gia').hasClass('update')){
                $(`#td-${id}`).html($('#ten-tac-gia').val());
            }
            else{
               setTimeout(()=>{
                window.location= window.location.href;
               },1000);
            }
        }
        else
            toastr.error(e.mess);
    });


});

$('.update-tac-gia').on('click', (e) => {
    let id = e.currentTarget.id;
    id = id.split('-')[1];
    $.ajax({
        url: `/admin/tac-gia/${id}`,
        method: 'GET'
    }).done((r) => {

        $('#ten-tac-gia').val(r.data.columns.tenTacGia);
        $('#save-tac-gia').addClass('update');
        $('#save-tac-gia').html('Sửa');
        $('#save-tac-gia').prop('name', `id-${id}`);
        $('.modal-custom').removeClass('hide');
    });
});


function create_TacGia() {

}