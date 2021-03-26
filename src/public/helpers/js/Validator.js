function Validator(options) {

    let form = $(options.form);
    const classNameError = '.info-error';
    let isValid = true;
    options.rules.forEach(element => {
        // thuc thi cac luat
        
        let selector = '';
        if(element.name !== undefined)
           selector= options.form + ' ' + element.name;
        else  
          selector = element.selector;

        if (element['value'] === undefined)
            element.value = $(selector).val();
        let errorMessage = element.validate(element.value);
        
        
        let selectorError = selector + ' + ' + classNameError;
        if (element.selectorError !== undefined)
            selectorError = element.selectorError
        

        if (errorMessage !== undefined) {
            $(selectorError).html(errorMessage);
            isValid = false;
            console.log(`${element.name}  ${errorMessage}`);
        } else {
            $(selectorError).html('');
        }


    });
    //    console.log(isValid);
    return isValid;

}

/// Khai bao cac luat 
/// 1. khong duoc bo trong
Validator.isRequire = function (element,value) {
    let rs = {
        name: element,
        validate: function (value) {
            return value.trim() ? undefined : 'Không được bỏ trống'
        }
    };
    
    if(value !== undefined)
        rs.value = value;
    return rs;
}


/// 2. Min length
Validator.minLength = function (element, min) {
    return {
        name: element,
        validate: function (value) {
            return value.trim().lenght() > min;
        }
    }
}

Validator.isEmail = function(element){
    return {
       name : element,
       validate: function (email) {
        const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase()) === false ? 'Đây không phải email' : undefined;
    } 
    }
}
