
class Model{
   static tableName = '';
   constructor(){
       this.id = 0;
       this.columns={};
   }
   

    getStringInsert(){
      let columns = '(';
      let values   = '(';

      for(let [key,value] of  Object.entries(this.columns)){
           columns += key+',';
           if(typeof value === 'number')
           values += `${value},`;
           else values += `'${value}',` ;
           values   +=  isText ? `'${value}',` : `${value}`; 
      }
      columns = columns.slice(0,columns.length-1);
      values  = values.slice(0,values.length-1);
      columns +=')';
      values  +=')';

      return `INSERT INTO ${this.getTableName()} VALUES ${columns} ${values}`;

   }
   
   getTableName(){
      return '';
   }


  getStringUpdate(){
      let strUpdate = '';
      for(let [key,value] of  Object.entries(this.columns)){
         strUpdate+= `${key}=`;
         
         if(typeof value === 'number')
         strUpdate+= `${value},`;
         else strUpdate += `'${value}',` ;
      }
      strUpdate = strUpdate.slice(0,strUpdate.length-1);
      return `UPDATE ${this.getTableName()} SET ${strUpdate} WHERE id = ${this.id}`;

  }

}


module.exports = Model;