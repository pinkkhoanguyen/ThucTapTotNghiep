$('#form-login').on('submit', (e) => {

    e.preventDefault();
    //console.log('dang nhap');

    if (Validate() === true) {
       $.ajax({
            url:'/admin/nguoi-dung/login',
            method:'POST',
            data: {
                'email': $('#inputEmail').val(),
                'pass' : $('#inputPassword').val()
            }
       }).done((rs)=>{
            if(rs.result === false){
                $('#thong-bao').text(rs.message);
            }else{
                console.log('dang nhap thanh cong')
                $('#thong-bao').text('');
               
                window.location.href =`${window.location}the-loai`
               
            }

       });
    }
});


function Validate() {
    return Validator(
        {
            form: '#form-login',
            rules: [
                Validator.isRequire('#inputEmail'),
                Validator.isRequire('#inputPassword'),
                Validator.isEmail('#inputEmail')
            ]
        }
    );
};