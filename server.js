/*
    The Code below is for Mysql manipulation.
    What we need to do is to call handle_database everytime we want to access and modify database.
*/

var express   =    require("express");
var bodyParser =   require("body-parser");
var app       =    express();


app.use(bodyParser.urlencoded({ extended: false }));
//adding our main.js which is our router file and passing app which is instance of express to it because we need it to send response to browser.
require('./router/main')(app);
//defines where our HTML files are placed so that Server can locate and render them
app.set('views',__dirname + '/views');
app.use(express.static(__dirname + '/views'));
//set the view engine or simply presentation factor to EJS which is responsible for HTML rendering.
app.set('view engine', 'ejs');
//tell Server that we are actually rendering HTML files through EJS.
app.engine('html', require('ejs').renderFile);


var server=app.listen(8080,function(){
  console.log("Express is running on port 8080");
});

/*
app.get('/',function(req,res){
    //console.log(handle_database("SELECT * From User;", res));
    handle_database("SELECT email From User;", res);
});

var server=app.listen(8080,function(){
  console.log("Express is running on port 8080");
});
*/