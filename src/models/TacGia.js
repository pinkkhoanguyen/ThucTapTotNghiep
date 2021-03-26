const database = require("../databases/Manager_DB");

class TacGia{
    static tableName = 'TacGia';
    constructor(){
       this.id = '';
       this.columns = 
                    {
                        tenTacGia:''
                    };
       this.tableName  = 'TacGia';
    }
    
    build(tenTacGia){
       this.columns.tenTacGia = tenTacGia;
    }


    // tien hanh luu vao database
    async save(isCreated){
        
        let sql = '';
        // insert
        if(isCreated){
            
           sql = `INSERT INTO ${this.tableName} (tenTacGia) VALUES ('${this.columns.tenTacGia}')`;
           try {
               let results = await database.excute(sql);
               this.id = results.insertId;
           } catch (error) {
               throw error;
           }
        }

        // update
        else{
             sql = `UPDATE ${this.tableName} SET tenTacGia='${this.columns.tenTacGia}' `+
             `WHERE id = ${this.id}`;
             try {
                 let rs = await database.excute(sql);                    
             } catch (error) {
                 throw error;
             }
        }
    }
    
    remove(id){

    }
    

    // xuat ra danh sach the loai co trong bang
    static async list(){
      let sql = `SELECT * FROM ${this.tableName}`;
      let list =[];
      try {
        let results = await database.excute(sql);
        results.forEach(element => {
           let tg = new TacGia();
            tg.id = element.id;
            tg.columns.tenTacGia = element.tenTacGia;
            list.push(tg);
        });
        return list;

       } catch (error) {
         throw error; 
      } 
    }
    //// find id   
    static async findById(id){
        let sql = `SELECT * FROM ${this.tableName} WHERE id = ${id}`;
        try {
            let rs = await database.excute(sql);
            let tacgia = new TacGia();
            tacgia.columns.tenTacGia = rs[0].tenTacGia;
            tacgia.id = rs[0].id;
            return tacgia;
        } catch (error) {
            throw error;
        }
    }

}

module.exports = TacGia;