const database = require('../databases/Manager_DB');
class TheLoai{
    constructor(){
       this.id = '';
       this.columns = 
                    {
                        tenTheLoai:'',
                        moTa:''
                    };
       this.tableName  = 'TheLoai';
    }
    build(id,tenTheLoai,moTa){
        this.id = id;
        this.columns.tenTheLoai = tenTheLoai;
        this.columns.moTa = moTa;
        this.tableName = 'TheLoai';
    }
    
    // tien hanh luu vao database
    async save(isCreated){
        
        let sql = '';
        // insert
        if(isCreated){
            
           sql = `INSERT INTO ${this.tableName} (tenTheLoai,moTa) VALUES ('${this.columns.tenTheLoai}','${this.columns.moTa}')`;
           try {
               let results = await database.excute(sql);
               this.id = results.insertId;
           } catch (error) {
               throw error;
           }
        }

        // update
        else{
             sql = `UPDATE ${this.tableName} SET moTa='${this.columns.moTa}',tenTheLoai='${this.columns.tenTheLoai}' `+
             `WHERE id = ${this.id}`;
             try {
                 let rs = await database.excute(sql);
                 this.id = rs.id;                   
             } catch (error) {
                 throw error;
             }
        }
    }
    
    remove(id){

    }
    

    // xuat ra danh sach the loai co trong bang
    static async list(){
      let sql = 'Select * from theloai';
      let list =[];
      try {
        let results = await database.excute(sql);
        results.forEach(element => {
           let tl = new TheLoai();
           tl.build(element.id,element.tenTheLoai,element.moTa);
           list.push(tl);
        });
        return list;

       } catch (error) {
         throw error; 
      } 
    }
    //// find id   
    static async findById(id){
        let sql = `SELECT * FROM TheLoai WHERE id = ${id}`;
        try {
            let rs = await database.excute(sql);
            let theLoai = new TheLoai();
            theLoai.columns.tenTheLoai = rs[0].tenTheLoai;
            theLoai.columns.moTa = rs[0].moTa;
            theLoai.id = rs[0].id;
            return theLoai;
        } catch (error) {
            throw error;
        }
    }

    
}

module.exports = TheLoai;
