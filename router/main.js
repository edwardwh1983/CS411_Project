var mysql     =    require('mysql');

var pool      =    mysql.createPool({
    connectionLimit : 100,
    host     : 'localhost',
    user     : 'yanwen',
    password : '1234',
    database : 'connectme',
    debug    :  false
});

var email   = require('emailjs/email');

var Sender  = email.server.connect({
   user:    "connectmeuiuc",
   password:"connectme1234",
   host:    "smtp.gmail.com",
   ssl:     true
});

module.exports=function(app){
  var curUser;
  //handle main page
	app.get('/',function(req,res){
		res.render('index.html');
	});

  //handle user login
  app.post('/LOGIN', function (req, res) {
    var role = req.body.role;
    var userName=req.body.user;
    var passWord=req.body.password;
    login(role, userName, passWord, res);
  });

  //handle admin login
  app.post('/LOGIN_admin', function (req, res) {
    var role = req.body.role;
    var userName=req.body.user;
    var passWord=req.body.password;
    login(role, userName, passWord, res);
  });


  function login(role, userName, passWord, res){
    var query;
    if(role == 0){
      query = "select password from admin where netid = '" + userName + "';";
    }else{
      query = "select password from user where netid = '" + userName + "';";
    }
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
          if(rows.length != 0 && rows[0].password == passWord){
            res.send("true");
            curUser = userName;
          }
          else{
            res.send("false");
          }
        }
      });
    });
  }

  //field Information
  app.post('/getField', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select distinct field from job;";
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  //user Information
  app.post('/userInfo', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select * from user where netid = '" + curUser + "';";
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  app.post('/addUser', function (req, res) {
    var userName=req.body.userName;
    var passWord=req.body.password;
    var email=req.body.email;
    var query = "INSERT INTO User(NetID, Password, Email) VALUES (N'" + userName +"', N'" + passWord + "', N'" + email + "');";
    console.log(query);
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
            res.send("true");
            curUser = userName;
        }
        else{
            res.send("false");
        }
      });
    });
  });

  //Company info
  app.post('/companiesName', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select name from company;"
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  app.post('/companiesInfo', function (req, res) {
    pool.getConnection(function(err,connection){
      var comName = req.body.companyName;
      var query = "select * from company where name = '" + comName + "';"
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });


  // JobID info
  app.post('/jobInfo', function (req, res) {
    pool.getConnection(function(err,connection){
      var jobID = req.body.jobID;
      var query = "select * from job natural join interviewquestion where ID = '" + jobID + "';"
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });


  //Search Job info
  app.post('/searchJob', function (req, res) {
    pool.getConnection(function(err,connection){
      if(!err){
        var field = req.body.field;
        var location = req.body.location;
        var selectedDeg;
        var selectedDCom;
        var arrDeg = [];
        var arrCom = [];
        var query;
        if(!('selectedDeg[]' in req.body) && !('selectedCom[]' in req.body)){
          if(field == "All" && location == "All State")
            query = "select * from job;";
          else if(field == "All")
            query = "select * from job where location='" + location +"';";
          else if(location == "All State")
            query = "select * from job where field='" + field +"';";
          else
            query = "select * from job where location='" + location + "' and field='" + field +"';";
        }
        else{
          //handle werid behavior of body parse
          if('selectedDeg[]' in req.body){
            selectedDeg = req.body['selectedDeg[]'];
            if(Array.isArray(selectedDeg))
              arrDeg = selectedDeg;
            else
              arrDeg.push(selectedDeg);
          }
          if('selectedCom[]' in req.body){
            selectedCom = req.body['selectedCom[]'];
            if(Array.isArray(selectedCom))
              arrCom = selectedCom;
            else
              arrCom.push(selectedCom);
          }

          //now, do the business
          query = "select * from ";
          if(arrDeg.length > 0){
            var content = "(select * from job where "
            for(var i in arrDeg)
              content += "MinimumDegree = '" + arrDeg[i] + "' or ";
            query += content.slice(0,-4) + ") as a";
          }
          if(arrCom.length > 0){
            var content;
            if(arrDeg.length > 0)
              content = "(select id from job where "
            else
              content = "(select * from job where "

            for(var i in arrCom)
                content += "Company = '" + arrCom[i] + "' or ";

            if(arrDeg.length > 0)
              query += " where id in " + content.slice(0,-4) + ")";
            else
              query += content.slice(0,-4) + ") as b";
          }
          if(field == "All" && location == "All State")
            query = "select * from (" + query + ") as c;";
          else if(field == "All")
            query = "select * from (" + query + ") as c where location='" + location +"';";
          else if(location == "All State")
            query = "select * from (" + query + ") as c where field='" + field +"';";
          else
            query = "select * from (" + query + ") as c where location='" + location + "' and field='" + field +"';";
        }
        console.log(query);
        connection.query(query, function(err,rows){
          connection.release();
          res.send(rows);
        });
      }
    });
  });

  //Degree info
  app.post('/getDegree', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select distinct minimumDegree from job;"
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  //handle user skills
  app.post('/haveSkill', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select Skill from haveskill where netid = '" + curUser + "';";
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  //Update user Information
  app.post('/saveUserInfo', function (req, res) {
    var firstName = req.body.firstName;
    var lastName = req.body.lastName;
    var birthday = req.body.birthday;
    var email = req.body.email;
    var phone = req.body.phone;
    var major = req.body.major;
    var address = req.body.address;
    var city = req.body.city;
    var state = req.body.state;
    pool.getConnection(function(err,connection){
      var query = "update user set FirstName = '" + firstName + "', lastName = '" + lastName + "', email = '" + email + "', phone = '" + phone + "', Address = '" + address + "', city = '" + city + "', state = '" + state + "' where netid = '" + curUser + "';";
      //console.log(query);
      connection.query(query, function(err,rows){
        connection.release();
        if(err){
          res.send("false");
          return;
        }
        res.send("true");
      });
    });
  });
  app.post('/updateSkill', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "delete from haveskill where netid = N'" + curUser + "';";
      var error = false;
      connection.query(query, function(err,rows){
        if(err){error = true;}
      });
      if(req.body.C=='true'){
        query = "insert into haveskill values (N'" + curUser + "', " + "N'C');";
        connection.query(query, function(err,rows){
          if(err){error = true;}
        });
      }
      if(req.body.Cpp=='true'){
        query = "insert into haveskill values (N'" + curUser + "', " + "N'C++');";
        connection.query(query, function(err,rows){
          if(err){error = true;}
        });
      }
      if(req.body.Java=='true'){
        query = "insert into haveskill values (N'" + curUser + "', " + "N'Java');";
        connection.query(query, function(err,rows){
          if(err){error = true;}
        });
      }
      if(req.body.Python=='true'){
        query = "insert into haveskill values (N'" + curUser + "', " + "N'Python');";
        connection.query(query, function(err,rows){
          if(err){error = true;}
        });
      }
      if(req.body.SQL=='true'){
        query = "insert into haveskill values (N'" + curUser + "', " + "N'SQL');";
        connection.query(query, function(err,rows){
          if(err){error = true;}
        });
      }
      connection.release();
      if(!error)
        res.send("true");
      else
        res.send("false");
    });
  });


  //handle user list
  app.post('/haveUser', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select * from user";
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  //handle job list
  app.post('/haveJob', function (req, res) {
    pool.getConnection(function(err,connection){
      var query = "select * from job";
      connection.query(query, function(err,rows){
        connection.release();
        res.send(rows);
      });
    });
  });

  //handle delete job from job list
  app.post('/deleteJob', function (req, res) {
    var id=req.body.jobID;
    var query = "delete from job where ID = " + id + ";";
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
            res.send("true");
        }
        else{
            res.send("false");
        }
      });
    });
  });

  //handle get job information and display
  /*app.post('/jobInfo', function (req, res) {
    var id=req.body.jobID;
    var query = "select * from job where ID = " + id + ";";
    console.log(query);
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
            res.send("true");
        }
        else{
            res.send("false");
        }
      });
    });
  });*/

  //handle edit job from job list and add to db
  app.post('/editJobInfo', function (req, res) {
    var jobID=req.body.ID;
    var jobTitle=req.body.Title;
    var jobCom = req.body.Company;
    var jobLoc = req.body.Location;
    var jobDeg = req.body.Degree;
    var jobDes = req.body.Description;

    //add to db
    var query = "Update Job set Company = N'" + jobCom + "', FIELD = N'" + jobTitle + "', Description = N'" + jobDes + "', MinimumDegree = N'" + jobDeg + "', Location = N'" + jobLoc + "' where ID =" + jobID+ ";";
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
            res.send("true");
            //curUser = userName;
        }
        else{
            res.send("false");
        }
      });
    });
  });

  //handle add job into job list and add to db
  app.post('/addJobInfo', function (req, res) {
    var jobID=req.body.ID;
    var jobTitle=req.body.Title;
    var jobCom = req.body.Company;
    var jobLoc = req.body.Location;
    var jobDeg = req.body.Degree;
    var jobDes = req.body.Description;
    var jobLink = req.body.Link;

    //insert into db
    var query = "INSERT INTO Job VALUES ("+jobID+", N'" + jobCom + "', N'" + jobDes + "', N'" + jobTitle + "', N'" + jobDeg + "', N'" + jobLoc + "', N'" + jobLink + "');";
    console.log(query);
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
            res.send("true");
            //curUser = userName;
        }
        else{
            res.send("false");
        }
      });
    });
  });

  //Generate confirm code
  app.post('/generateConfirmCode', function (req, res) {
    require('crypto').randomBytes(3, function(ex, buf) {
      var email = req.body.userEmail;
      var code = buf.toString('hex');
      Sender.send({
         text:    "Your confirm code is: " + code,
         from:    "ConnectMe",
         to:      email,
         cc:      "",
         subject: "Hello from ConnectMe"
      }, function(err, message) {
        if(!err)
          res.send(code);
        else
          res.send("/IncorrectEmail");
      });
    });
  });

  app.post('/getSkillsByUser', function (req, res) {
    var query = "select * from haveskill where NetID = '"+curUser+"';";
    console.log(query);
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
            res.send(rows);
        }
      });
    });
  });

  //select * from requireskill natural join job natural join haveskill where requireskill.jobid = job.id and haveskill.skill = requireskill.skill and haveskill.netid = 'whuo3' and requireskill.skill = 'C';
  app.post('/recJobs', function (req, res) {
    var skill = req.body.skill;
    var query = "select job.*, requireskill.skill";
    query += " from requireskill natural join job natural join haveskill ";
    query += "where requireskill.jobid = job.id ";
    query += "and haveskill.skill = requireskill.skill ";
    query += "and haveskill.netid = '"+ curUser + "';";
    pool.getConnection(function(err,connection){
      connection.query(query, function(err,rows){
        connection.release();
        if(!err) {
          console.log(query);
          res.send(rows);
        }
        else
          console.log("Err happen");
      });
    });

  });

}