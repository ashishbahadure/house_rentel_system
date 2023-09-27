var express = require("express");
var app = express();

// app.use(express.static("/public/"));
app.use(express.static(__dirname +'/public/'));
 
//Body Parser
var bodyparser = require("body-parser");
app.use(bodyparser.urlencoded({extended:true}));

//files 
var upload = require('express-fileupload');
app.use(upload());

//Session
var session = require("express-session");
app.use(session({
    secret:"AVI",
    resave:true,
    saveUninitialized:true,
    cookie:{secure:false,maxAge:2*60*60*1000}
})); 

//Routes
// var adminRoute = require("./routes/admin_routes");
var userRoute = require("./routes/user_routes");

app.use("/",userRoute);
// app.use("/admin",adminRoute);

app.listen(1000);
