const TheLoai = require('../../models/TheLoai');

const multer  = require('multer');
const path = require('path');


let pt = '../../../src/public/uploads/img/truyen/anhbia';
let storge = multer.diskStorage({
    destination: function (req, file, cb) {
        let path_ = path.join( __dirname,pt).toString();
     
       cb(null,path_);

   },
   filename: function (req, file, cb) {
     cb(null,  Date.now().toString()+"-"+file.originalname)
   }
}); 
let upload = multer({storage:storge});

class TruyenController{
     
    constructor(){

        
       
    }
    async index(req,res){
       
       
       res.render('admin/truyen.index.ejs');
    }
    
    async create(req,res) {
        let theLoais = await TheLoai.list();
        
        res.render(
            'admin/truyen.save.ejs',{
                theLoais: theLoais
            }
        );
    }
    
    store(req,res){
        upload.array('files',10)(req,res,(error)=>{
             if(error)
               console.log('LOI :     '+error);
            else
            {
               

            }
            
        });
        
      
    }

    edit(req,res){

    }

    update(req,res){

    }
   
     


};
const controller = new  TruyenController();
module.exports = controller;