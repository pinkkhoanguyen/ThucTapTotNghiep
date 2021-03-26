
const db = require("../../databases/Manager_DB");
const TacGia = require("../../models/TacGia");
class TacGiaController{
   async index(req,res){
        let list = await TacGia.list();
             
        
        for(let i = 0;i<(await list).length;i++){
            let sql = `SELECT count (tg.id) as soLuong FROM TacGia tg, Truyen tr WHERE `+
            `tg.id = tr.maTacGia and tg.id = ${list[i].id} GROUP BY tg.id`;
            let sl = await db.excute(sql).soLuong;
            if(sl===undefined)sl = 0;
            list[i].soLuong = sl;
        }
        
        res.render
        ('admin/TacGia.index.ejs',
         {
             'data':list,
             
          }
        );
    }
    

   async store(req,res){
        let tacGia = new TacGia();
        tacGia.columns.tenTacGia =  req.body.tenTacGia;
        try {
           await tacGia.save(true);      
           res.send(
               {
                   complete:true,
                   mess:'Tạo tác giả thành công',
                   newTacGia:tacGia
                }
           ); 
        } catch (error) {
            res.send(
                {complete:false,mess:'Không tạo được tác giả'}
            ); 
        }
    }

     
  async  update(req,res){
        let tacGia = new TacGia();
        tacGia.id = req.params.id;
        tacGia.columns.tenTacGia =  req.body.tenTacGia;
       
        try {
           await tacGia.save();      
           res.send(
               {complete:true,mess:'Sửa thành công'}
           ); 
        } catch (error) {

            console.error(error);
            res.send(
                {complete:false,mess:'Không sửa được tác giả'}
            ); 
        }
    }


    async info(req,res){
        try {
            let tg = await TacGia.findById(req.params.id);
           
           res.send({'data':tg}); 
           
        } catch (error) {
            throw error;
        }
    }


    async getTacGias(req,res){
        
        try {
            let tacGias = await TacGia.list(); 
          res.send({tacGias:tacGias});
          return;  
        } catch (error) {
            console.error(error);
        }
 
       // res.send(promise);
    }

}

let controller = new TacGiaController();
module.exports = controller;