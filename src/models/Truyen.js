const db = require('../databases/Manager_DB');
const Model = require('./Model')
class Truyen extends Model {

    constructor() {
        super();
        this.columns = {
            tenTruyen: '',
            tomTat: '',
            soChuong: 0,
            moKhoa: 1,
            tinhTrang: 'Đang tiến hành',
            ngayDang: '',
            maTacGia: 0,
            anhBia: 0,
            ///maBaiDang: 0
        };

        this.tableName = 'Truyen';
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

}

module.exports = Truyen;