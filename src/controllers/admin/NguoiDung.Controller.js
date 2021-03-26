
const db = require("../../databases/Manager_DB");
const NguoiDung = require("../../models/NguoiDung");
class TacGiaController{
   async index(req,res){
       
    }
    

   async store(req,res){
      
    }

     
  async  update(req,res){
       
    }


    async info(req,res){
       
    }


    async getTacGias(req,res){
        
    }


    async login(req,res){
        let email = req.body.email;
        let pass = req.body.pass;   ///// CHUA MA HOA 
        

        
        let nguoiDung =  new NguoiDung();
        try {
            nguoiDung = await nguoiDung.findByEmail(email);
           
            if(nguoiDung.id === undefined || nguoiDung.columns.matKhau !== pass){
                res.send({
                    result : false,
                    message : 'Thông tin đăng nhập không chinh xác, đề nghị kiểm tra'
                })
            }
            else  res.send({
                result : true,
                message : 'Đăng nhập thành công'
            })
        } catch (error) {
            console.error(error);
            res.send({
                result : false,
                message : 'Thông tin đăng nhập không chinh xác, đề nghị kiểm tra'
            })
        }


    }

}

let controller = new TacGiaController();
module.exports = controller;