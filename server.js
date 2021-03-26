const express      = require("express");
const path         = require("path");
const bodyParser   = require("body-parser");
const configEnv    = require("dotenv");
const routing      = require("./src/routes/configRoute");
const app          = express();  
// const Database     = require('./src/databases/MySql_DB');
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

/// config Env
configEnv.config();

/// config static folder 
app.use(express.static(path.join(__dirname+"/src/public")));

/// config view engine
app.set('view engine', 'ejs');
app.set("views",path.join(__dirname+"/src/resources/views"));

// routing
app.use(routing);

/// start server at port 
let Port = process.env.PORT ;

app.listen(Port,()=>{
    console.log(`Server starting at ${Port}`);
});
