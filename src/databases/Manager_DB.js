let db  = require('./MySql_DB');

module.exports.excute = function excQuery(sql) {   
   return new Promise((resovle,reject)=>{
      db.pool.getConnection(function(err, connection) {
         
         if (err) {
            console.log(`loi: ${err}`);   
            reject(err);
         }
        
         // Use the connection
         connection.query(sql, function (error, results, fields) {
           
           if (error) reject(error);
           resovle(results);
           
           connection.release();
         });
       });
   });
}


