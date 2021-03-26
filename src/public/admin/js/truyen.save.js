$('#upload-thumbnail').on('click', () => {
    $('#thumbnail-image').trigger('click');
    $('#thumbnail-image').removeClass('none');
});

$('#thumbnail-image').on('change', (e) => {
    readImage('#thumbnail-image', e, '#group-thumbnail .info-error'
        , (result) => {
            let img = document.getElementById('thumbnail');
            if (img !== null) img.remove();
            $('#group-thumbnail').append(
                `<img src=${result.url} id='thumbnail'>`
            );
            $('#group-thumbnail .file-upload-info').val(result.name);
        });
});


$('#upload-anh-bia').on('click', () => {
  
    $('#anh-bia-image').trigger('click');
    $('#anh-bia-image').removeClass('none');
});

$('#anh-bia-image').on('change', (e) => {
    readImage('#anh-bia-image', e, '#group-anh-bia .info-error'
        , (result) => {
            let img = document.getElementById('anh-bia');
            if (img !== null) img.remove();
            $('#group-anh-bia').append(
                `<img src=${result.url} class ='anh-bia' id='anh-bia'>`
            );
            $('#group-anh-bia .file-upload-info').val(result.name);
        });
});



function readImage(crrSelector, e, selectorError, cb) {
    let files = e.target.files;
    let file = files[0];
    let reader = new FileReader();

    reader.onloadstart = () => {
        ///check here
        if (!file.type.includes('image')) {
            $(selectorError).html('Phải truyền vào 1 image');
            reader.abort();
        } else {
            $(selectorError).html('');
        }
    }
    reader.onloadend = () => {
        if (reader.result === null) {
            $(crrSelector).addClass('invalid');
        } else {

            $(crrSelector).removeClass('invalid');
            cb({ url: reader.result, name: file.name });
        }
    };
    reader.readAsDataURL(file);
}


async function checkForm() {
    return Validator({
        form: '#form-truyen',
        rules: [
            checkTacGia('#tac-gia'),
            checkImage('#thumbnail-image', '#group-thumbnail'),
            checkImage('#anh-bia-image', '#group-anh-bia'),
            checkTheLoai(''),
            Validator.isRequire('#ten-sach'),
            Validator.isRequire('#tac-gia'),
            Validator.isRequire('#tom-tat'),
        ]
    });
}



// check image 
function checkImage(selector, group) {
    return {
        name: selector,
        selectorError: `${group} .info-error`,
        validate: () => {
            if ($(selector).hasClass('none'))
                return 'Không được bỏ trống';
            else if ($(selector).hasClass('invalid'))
                return 'Ảnh không hợp lệ';
            else return undefined;
        }
    }

}

// check the loai
function checkTheLoai() {

    return {
        selectorError: '#group-the-loai .info-error',
        validate: () => {
            let checks = document.querySelectorAll('input.check-the-loai:checked');
            return checks.length !== 0 ? undefined : 'Hãy chọn một hoặc nhiều thể loại';
        }
    }

}


/// check tac gia 
function checkTacGia(selector) {
    return {
        name:selector,
        validate: ()=>{
           
            for(let i = 0;i<tacGias.length;i++){
                if(tacGias[i].columns.tenTacGia === $(selector).val())
                  return undefined;
            }
            return 'Tác giả không tồn tại';
        }
    } 
}


function getDSTL() {
    let checks = document.querySelectorAll('.check-the-loai:checked');
    let ds= [];
    checks.forEach(e=>{
        ds.push($(e).val());
    });
    return ds;
}
/// form submit
$('#form-truyen').ajaxForm({
    method:'POST',
    beforeSubmit:async()=>{
        let hopLe = await checkForm();
        return hopLe;
    },
    data:{
        'ds-the-loai': getDSTL()
    },
    success: ()=>{
        console.log('OK');
    }


});


/// list tac gia
let tacGias = [];
function  getTacGias(cb) {
    $.ajax({url:'/admin/tac-gia/getTacGias',method:'GET'})
    .done((rs)=>{
        cb(rs.tacGias);
    });
}
document.addEventListener("DOMContentLoaded", function(event) { 
    getTacGias((rs)=>{
        
        tacGias = rs;
   });
 });

$('#tac-gia').on('keyup', (e) => {

   
    let noiDung = $('#tac-gia').val();
    if (noiDung.length <= 3) {
        $('.autocomplex-text').addClass('d-none');
        return;
    }


    let arr = [];
    tacGias.forEach(ele => {
        noiDung = noiDung.toLowerCase();
        if (ele.columns.tenTacGia.toLowerCase().includes(noiDung)) {
            arr.push(ele);

        }
    });
    generateAutoList(arr);
});


$(document).on('click', '.autocomplex-text ul li', (e) => {
    let text = e.target.innerText;
    $('#tac-gia').val(text);
    $('.autocomplex-text').addClass('d-none');
});




function generateAutoList(rs) {
    $('.autocomplex-text ul').html('');
    let str = '';
    if (rs.length === 0) {$('.autocomplex-text').addClass('d-none'); return;}
    rs.forEach(element => {
        str += `<li class='li-tac-gia' id='tg-${element.id}'>${element.columns.tenTacGia}</li>`;
    });

    $('.autocomplex-text ul').append(str);
    $('.autocomplex-text').removeClass('d-none');
}


/// check click outside hide autocomplex text
$(document).on('mouseup',function(e) 
{
    var container = $("autocomplex-text");

    // if the target of the click isn't the container nor a descendant of the container
    if (!container.is(e.target) && container.has(e.target).length === 0) 
    {
        $('.autocomplex-text').addClass('d-none');
    }
});

