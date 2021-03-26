


// khi nguoi dung click submit
$('#submit-create-the-loai').on('click',function(event){
    event.preventDefault();
   let isValid= validated();
   console.log(isValid);
   if(isValid)submit();
});

/// kiem tra input
function validated(){
    return Validator(
        {
            form: '.forms-the-loai',
            rules: [
                Validator.isRequire('#ten-the-loai'),
                Validator.isRequire('#mt-the-loai'),
            ]
        }
    );    
}

// custom rule
function textearaIsRequire(element){
     return {
         name:element,
         value: $(element).html(),
         validate:function (value) {
             return value.trim()?undefined:'Không được bỏ trống';
         }
     }
}



/// submit form
function submit() {
    $.ajax({
        method:'POST',
        url:$('#submit-create-the-loai').attr('href'),
        data: {
            'ten-the-loai': $('#ten-the-loai').val(),
            'mt-the-loai':$('#mt-the-loai').val()
        }
      })
      .done((result)=>{
          if(result.complete){
              toastr.success(result.mess);
              $('#ten-the-loai').val('');
              $('#mt-the-loai').val('');
          }else toastr.error('Có lỗi xảy ra');}
       );
}