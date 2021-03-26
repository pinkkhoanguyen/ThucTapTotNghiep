const db = require('../databases/Manager_DB');
const Model = require('./Model')
class NguoiDung extends Model {

    constructor() {
        super();
        this.columns = {
            ten_ND: '',
            matKhau: '',
            email: '',
            sdt: '',
            ngayTao: '',
            ngayCapNhat: '',
            
        };

        this.tableName = 'NguoiDung';
    }


    async save(isCreated) {
        try {

            if (isCreated) {
                /// create
                await this.create();
            }else{

            }

        } catch (error) {

        }

    }

    async create() {
        try {
            let sql = super.getStringInsert();
            let id = await db.excute(sql);
            this.id = id;
        } catch (error) {
            throw error;
        }
    }
    
    async update(){
        return super.getStringUpdate();
    }

    getTableName() {
        return this.tableName;
    }

    async findByID(id){
        let sql = `SELECT *  FROM ${this.tableName} WHERE id =${id}`;
        try {
            let rs = await db.excute(sql);
            console.log(rs);
            let nd = new NguoiDung();
            nd.id = rs.id;
            nd.columns.ten_ND = rs.ten_ND;
            nd.columns.matKhau = rs.matKhau;
            nd.columns.email = rs.email;
            nd.columns.sdt = rs.sdt;
            nd.columns.ngayTao = rs.ngayTao;
            nd.columns.ngayCapNhat = rs.ngayCapNhat;
            return nd;
        } catch (error) {
            console.log(error);
            throw error
        } 
    }

    async findByEmail(email){
        let sql = `SELECT *  FROM ${this.tableName} WHERE email = '${email}'`;
        try {
            let rs = await db.excute(sql);
            rs = rs[0];
            let nd = new NguoiDung();
            nd.id = rs.id;
            nd.columns.ten_ND = rs.ten_ND;
            nd.columns.matKhau = rs.matKhau;
            nd.columns.email = rs.email;
            nd.columns.sdt = rs.sdt;
            nd.columns.ngayTao = rs.ngayTao;
            nd.columns.ngayCapNhat = rs.ngayCapNhat;
            return nd;
        } catch (error) {
            throw error
        } 
    }

    
}

module.exports = NguoiDung;