const TheLoai = require('../../models/TheLoai');

class TheLoaiController{
   
    //router:  the-loai/
    async index(req,res){
        let list = await  TheLoai.list();
        res.render('admin/theloai.index.ejs',{
            theLoais:list
        });
    }
    
    // router: the-loai/create
    create(req,res){
        res.render(
            'admin/theloai.save.ejs',{
                'page':'Thêm mới thể loại',
                'link':'/admin/the-loai/store'
            });
    }

    // router: the-loai/store
    // save the loai
    async store(req,res){
        let theLoai = new TheLoai();
        theLoai.columns.tenTheLoai = req.body['ten-the-loai'];
        theLoai.columns.moTa = req.body['mt-the-loai'];
        try {
            await theLoai.save(true);
            res.send({complete:true,newTheLoai:theLoai,mess:'Thêm thành công!'});
        } catch (error) {
            res.send({complete:false});
        }
        
    }
    
    /// show form edit
    async edit (req,res){
       
        let id = req.params.id;
        let theLoai = await TheLoai.findById(id); 
       
        res.render(
            'admin/theloai.save.ejs',{
                'page':'Chỉnh sửa thể loại',
                'data':theLoai,
                'link':`/admin/the-loai/update/${id}`
            });
    }

    /// save update
    async update(req, res){
       let theLoai = new TheLoai();
       theLoai.build(req.params.id,req.body['ten-the-loai'],req.body['mt-the-loai']);
        try {
            await theLoai.save();
            res.send({complete:true,newTheLoai:theLoai,mess:'Sửa thành công!'});
        } catch (error) {
            console.log(error);
            res.send({complete:false});
        }
    }
}


const controller = new TheLoaiController();
module.exports = controller;