$(document).ready(function(){
  //global data
  var jobField;
  var jobLocation;
  selectedDeg = [];
  selectedCom = [];
  //handle rightColumn

  //handle company page
  $.fn.companyPage = function(companyName){
    $.post("/companiesInfo",{companyName: companyName}).done(function(data){
      var content = "";
      var Description = data[0].Content;
      var Headquarter = data[0].Headquarter;
      var Website = data[0].Website;
      var Industry = data[0].Industry;
      var Founded = data[0].Founded;
      content += "<div id=\""+companyName+"Info\">";
      content += "<div class=\"compHeader\">"+companyName+"<br></div>";
      content += "<div class=\"compInfo\"><b>Company Description</b>";
      content += "<input type = \"submit\" value=\"Return\" id=\"comReturn\">";
      content += "<p>" + Description + "</p>";
      content += "<b>Founded:</b> "+Founded+"<br>";
      content += "<b>Headquarters:</b> "+Headquarter+"<br>";
      content += "<b>Industry:</b> " +Industry+"<br>";
      content += "<b>Website:</b> <a href=\"" + Website+"\" target=\"_blank\">"+Website+"</a><br></div>";
      content += "</div>";
      $('#p1').hide();
      $('#fm2').hide();
      $('#fm3').hide();
      $('#userList').hide(); 
      $('#jobList').hide();  
      $('#editJob').hide();
      $('#addJob').hide();
      $('#addJob').hide();  
      $('#recomFrame').hide(); 
      $("#companyFrame").show();
      $('#jobFrame').empty();
      $('#jobFrame').hide();

      $("#companyFrame").html(content);
      $("#comReturn").click(function(){
        updateJobPage();
      }); 
    });
  }

  //handle job page
  $.fn.jobPage = function(jobID){
    $.post("/jobInfo",{jobID: jobID}).done(function(data){
      var content = "";
      var Field = data[0].FIELD;
      var Description = data[0].Description;
      var MinimumDegree = data[0].MinimumDegree;
      var Location = data[0].Location;
      var Link = data[0].Link;
      var count =1;

      content += "<fieldset>" + "<legend>About this job</legend>";
      content += "<div class=\"jobHeader\" id=\""+jobID+"Info\">";
      content += "<b>"+Field+ "</b><br>";
      content += "<div style=\"font-size:14px\">Location: "+Location+"</div>";
      content += "</div>";
      content += "<b style=\"color:#A9A9A9\">Job Description: </b>";
      content += "<input type = \"submit\" value=\"Return\" id=\"jobReturn\">";
      content += "<p>" + Description + "</p>";
      content += "<b style=\"color:#A9A9A9\">Minimum Degree:</b> " +MinimumDegree+"<br>";
      content += "<b style=\"color:#A9A9A9\">Recommended Interview Questions </b>";
      content += "<a id=\"RecQuestion\" href=\"#\">show</a>";
      content += "<a id=\"applyForJob\" href=\"" + Link+"\" target=\"_blank\">Apply Now</a>";
      content += "<div id=\"Questions\">"
      for(var row in data){
         content +="<p>"+count+". " + data[row].Question + "</p>";
         count = count+1;
      }
      content +="</div>";
      //content += "<div id=\"Questions\"><p>1. Find number of ones in an integer.</p><p>2. Print out, from small to big, of a sequence intergers, without sorting.</p></div>";
      content += "</fieldset>"

      $('#p1').hide();
      $('#fm2').hide();
      $('#fm3').hide();
      $("#companyFrame").hide();
      $('#userList').hide();
      $('#jobList').hide();
      $('#editJob').hide(); 
      $('#addJob').hide();
      $('#recomFrame').hide();     
      $('#jobFrame').empty();
      $('#jobFrame').show();
      $("#jobFrame").html(content);
      $("#jobReturn").click(function(){
        updateJobPage();
      }); 
	  $("#RecQuestion").click(function(){
        DisplayQuestion();
      });
    });
  }

  //handle show interview questions
  function DisplayQuestion(){
	   $('#Questions').toggle();
	   if($('#RecQuestion').html()=='show'){
			$('#RecQuestion').html('hide');
	   }
	   else{
			$('#RecQuestion').html('show');
	   }
  }

  //handle show job lists
  function appendJobFm(jobInfo, fmID){
    var content = "";
    var jobId = jobInfo.ID;
    var jobTitle = jobInfo.FIELD + " , " + jobInfo.MinimumDegree;
    var companyName = jobInfo.Company;
    var jobLocation = jobInfo.Location;
    content += "<div class=\"jobTab\" id=\"job"+jobId+"\">";
    content += "<p><a href=\"#\" class=\"jobTitle\" onclick=\"$(this).jobPage('"+jobId+"')\">" +jobTitle+ "</a></p>";
    content += "<p><a href=\"#\" class=\"jobCompany\" onclick=\"$(this).companyPage('"+companyName+"')\">" +companyName+ "</a></p>";
    content += "<p class=\"jobLocation\">" + jobLocation + "</p>";
    content += "</div>";
    $(fmID).append(content);    
  }
  function updateJobPage(){ 
      $('#p1').hide();
      $('#fm2').hide();
      $('#fm3').hide();
      $("#companyFrame").hide();
      $('#userList').hide();
      $('#jobList').hide();
      $('#editJob').hide();
      $('#addJob').hide(); 
      $('#recomFrame').hide();
      $('#jobFrame').empty();
      $('#jobFrame').show();
      $.post("/searchJob",{selectedDeg: selectedDeg, selectedCom: selectedCom, field: jobField, location: jobLocation}).done(function(data){
        for(var row in data){
          appendJobFm(data[row], "#jobFrame");
        }
      });
  }
  //handle leftColumn(Not, done, only finish company)
  $.post("/getDegree", function(data){
    for(var row in data){
      var id = data[row].minimumDegree.replace(/\s/g, '');
      $("#degreeMenu").append("<li id=\""+ id +"\"><a href=\"#\">" + data[row].minimumDegree + "</a></li>");
      $("#"+data[row].minimumDegree.replace(/\s/g, '')).bind( "click", function() {
        var val = $(this).find("a").html();
        //Note that the id used for selected and unselected elements are different
        $("#selMenu").append("<li id=\""+ $(this).attr("id") +"S\"><a href=\"#\">" + val + "</a></li>");
        //Anything that is selected, update the content frame******************************
        selectedDeg.push(val);
        updateJobPage();
        var selId = ($(this).attr("id")) + "S";
        $("#" + selId).click(function(){
          var sid = ($(this).attr("id")).slice(0,-1);
          $("#"+sid).show();
          var removeEle = $(this).find("a").html();
          selectedDeg = jQuery.grep(selectedDeg, function(value) {
            return value != removeEle;
          });
          //Whenever there is an unselect, update the frame*********************************
          updateJobPage();
          $(this).remove();
        });
        $(this).hide();
      });
    }
  });
  $.post("/companiesName", function(data){
    for(var row in data){
      var id = data[row].name.replace(/\s/g, '');
      $("#companyMenu").append("<li id=\""+ id +"\"><a href=\"#\">" + data[row].name + "</a></li>");
      $("#"+data[row].name.replace(/\s/g, '')).bind( "click", function() {
        var val = $(this).find("a").html();
        //Note that the id used for selected and unselected elements are different
        $("#selMenu").append("<li id=\""+ ($(this).attr("id")) +"S\"><a href=\"#\">" + val + "</a></li>");
        //Anything that is selected, update the content frame******************************
        selectedCom.push(val);
        updateJobPage();
        var selId = ($(this).attr("id")) + "S";
        $("#" + selId).click(function(){
          var sid = ($(this).attr("id")).slice(0,-1);
          $("#"+sid).show();
          var removeEle = $(this).find("a").html();
          selectedCom = jQuery.grep(selectedCom, function(value) {
            return value != removeEle;
          });
          //Whenever there is an unselect, update the content frame**********************
          updateJobPage($(this).find("a").html(), false);
          $(this).remove();
        });
        $(this).hide();
      });
    }
  });
  $.post("/getField", function(data){
    for(var row in data)
      $("#fieldOption").append("<option value=\""+data[row].field+"\">"+data[row].field+"</option>");
  });

  //handle jobSearch(searchJob base on state and field)
  $("#searchJob").click(function(){
    jobField = $( "#fieldOption option:selected" ).text();
    jobLocation = $( "#stateOption option:selected" ).text();
    $("#searchField").show();
    updateJobPage();
  });

  //handle username and password
  $("#Login").click(function(){
    var role, user,pass;
    role=$( "#role option:selected" ).text();
    user=$("#username").val();
    pass=$("#password").val();
    if(role== 'Admin'){
      $.post("/LOGIN_admin",{role: 0, user: user, password: pass}).done(function(data){
        if(data=='true'){
          $('#fm').hide();
          $('#p1').hide();
          $('#p0').hide();
          $('#recomFrame').hide();
          $('#NewUser').hide();
          $('#a0').css('display','inline');
          $('#admin').css('display','block');
		  $('#transbox').hide();
		  $('#transbox1').show();
		  $('#rightColumn').css("background-color","rgba(248,248,248,0.8)");
		  $('#leftColumn').css("background-color","rgba(0, 0, 0, 0.4)");
		  $('#leftColumn').css("border-style","ridge");
		  $('#rightColumn').css("border-style","ridge");
        }else if(data=='false'){
          $("#p0").html("Invalid username or password.");
        }
      });
    }else{
      $.post("/LOGIN",{role: 1, user: user, password: pass}).done(function(data){
        if(data=='true'){
          $('#fm').hide();
          $('#p1').hide();
          $('#recomFrame').hide();
          $('#p0').hide();
          $('#NewUser').hide();
          $('#a0').css('display','inline');
          $('#fm1').css('display','block');      
          $('#dashboard').css('display','block');
		  $('#header').css('background-color',"transparent");
		  $('#header').css('color',"black");
		  $('connectme').css('background', "linear-gradient(to bottom, rgba(203,96,179,1) 0%,rgba(173,18,131,1) 50%,rgba(222,71,172,1) 100%)");
		  $('#backimage').attr("src", "job_search.jpg");
		  $('#transbox').hide();
		  $('#leftColumn').css("background-color","rgba(0, 0, 0, 0.4)");
		  $('#rightColumn').css("background-color","rgba(248,248,248,0.9)");
		  $('#leftColumn').css("border-style","ridge");
		  $('#rightColumn').css("border-style","ridge");
		  
        }else if(data=='false'){
          $("#p0").html("Invalid username or password.");
        }
      });      
    }

  });

  var confirmCode;
  $("#confirmCodeDialog").dialog({
        title: "Email Confirmation",
        autoOpen: false,
        modal: true,
        width: 500,
        height: 230,
        buttons: {
            "Resend Confirm Code": {
              text: "Resend Confirm Code",
              id: "resendCode",
              "class": 'dialogButton',
              click: function(){
                //$('#createAccount').trigger( "click" );
                $( "#resendCode" ).button("disable");
                var waitT = 10;
                var counter = 0;
                var interval = setInterval(function(){ 
                  if(counter == waitT){
                    $( "#resendCode" ).removeAttr('disabled').removeClass( 'ui-state-disabled' );
                    $( "#resendCode" ).text(" Resend Confirm Code ");
                    clearInterval(interval);
                  }
                  else{
                    var remainTime = waitT - counter;
                    counter += 1;
                    $( "#resendCode" ).text(' Resend avalable in ' + remainTime + 's ');
                  }
                }, 1000);
              }
            },
            "Ok": {
                text: "OK",
                "class": 'dialogButton',
                click: function() {
                  var code = $("#confirmCode").val();
                  if(code === confirmCode){
                    var userEmail = $("#NewUser_Email").val();
                    var userName = $("#NewUser_FN").val();
                    var pass = $("#NewUser_PW").val();
                    $.post("/addUser",{email: userEmail, userName: userName, password: pass}).done(function(data){
                      if(data=='true'){
                        $('#confirmCodeDialog').dialog("close");
                        $('#fm').hide();
                        $('#p1').hide();
                        $('#p0').hide();
                        $('#recomFrame').hide();
                        $('#a0').css('display','inline');
                        $('#fm1').css('display','block');
                        $('#updateAccount').trigger( "click" );
                        $('#NewUser').hide();
                        $('#dashboard').css('display','block');
                        alert("Thank you for register, please update you account information.");
                      }
                      else{
                        alert("Can not create account, username exists!");
                        $(this).dialog("close");
                      }
                    });
                  }
                  else{
                    alert("Incorrect confirm code, please enter again.");
                  }
              }
            },
            "Cancel":{
              text: "Cancel",
              "class": 'dialogButton',
              click: function() {;
                $(this).dialog("close");
              }
            }
        }
  });
  $("#createAccount").click(function(){
    $("#confirmCode").val("");
    var userEmail = $("#NewUser_Email").val();
    $.post("/generateConfirmCode",{userEmail: userEmail}).done(function(data){
      if(data == "/IncorrectEmail"){ 
        alert("Please type in the valid email address!");
      }
      else{
        confirmCode = data;
        $("#confirmCodeDialog").dialog("open");
      }
    });
  });

  //handle Account detail
  $("#accoungDetail").click(function(){
    $("#searchField").hide();
    $('#fm3').hide();
    $('#jobFrame').hide();
    $("#companyFrame").hide();
    $('#recomFrame').hide();
    $('#fm2').css('display','block');
    $.post("/userInfo", function(data){
      $("#acc_name").html(data[0].FirstName + " " + data[0].LastName);
      $("#acc_email").html(data[0].Email);
      $("#acc_phone").html(data[0].Phone);
      $("#acc_major").html(data[0].Major);
      $("#acc_address").html(data[0].Address + "," + data[0].City + "," + data[0].State);
    });
    $.post("/haveSkill", function(data){
      var temp = "";
      for(var row in data){
        temp += data[row].Skill + ",";
      }
      temp = temp.slice(0,-1);
      $("#acc_skills").html(temp);
    });
  });

  //handle Update Account
  $("#updateAccount").click(function(){
    $('#fm2').hide();
    $('#jobFrame').hide();
    $('#recomFrame').hide();
    $("#companyFrame").hide();
    $("#searchField").hide();
    $('#fm3').css('display','block');
    $.post("/userInfo", function(data){
      $("#firstName").val(data[0].FirstName);
      $("#lastName").val(data[0].LastName);
      $("#email").val(data[0].Email);
      $("#phone").val(data[0].Phone);
      $("#major").val(data[0].Major);
      $("#address").val(data[0].Address);
      $("#city").val(data[0].City);
      $("#state").val(data[0].State);
    });
    $.post("/haveSkill", function(data){
      for(var row in data){
        $("#" + data[row].Skill + "check").attr('checked', true);
      }
    });  
  });    
  $("#saveUserInfo").click(function(){
    var updateUser = false;
    var updateSkill = false;

    var firstName = $("#firstName").val();
    var lastName = $("#lastName").val();
    var birthday = $("#birthday").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    var major = $("#major").val();
    var address = $("#address").val();
    var city = $("#city").val();
    var state = $("#state").val();
    //Note that $.post is asynchronous
    $.ajax({
      method: "POST",
      url: "/saveUserInfo",
      async:false,
      data: {firstName: firstName, lastName: lastName, birthday: birthday, email: email, phone: phone, major: major, address: address, city: city, state: state}
    }).done(function(data){
      if(data=='true'){
        updateUser = true;
      }
    });
    var C = $("#Ccheck").is(':checked');
    var Cpp = $("#Cppcheck").is(':checked');
    var Java = $("#Javacheck").is(':checked');
    var Python = $("#Pythoncheck").is(':checked');
    var SQL = $("#SQLcheck").is(':checked');
    //Note that $.post is asynchronous
    $.ajax({
      method: "POST",
      url: "/updateSkill",
      async:false,
      data: {C: C, Cpp: Cpp, Java: Java, Python: Python, SQL: SQL}
    }).done(function(data){
      if(data=='true'){
        updateSkill = true;
      }
    });
    if(updateSkill && updateUser)
      alert("Updated !");
    else
      alert("Update Failed !");
  });
  $("#a0").click(function(){
  $('#recomFrame').hide();
	$('#CreateUser').hide();
	$('#username').val('');
	$('#password').val('');
	$('#AdminUser').css('backgroundColor','#C0C0C0');
	$('#AdminJob').css('backgroundColor','#C0C0C0');
	$('#backimage').attr("src", "careers.jpg");
	$('#transbox').show();
	$('#transbox1').hide();
	$('#header').css('background-color',"rgba(0,0,0,0.5)");
	$('#header').css('color',"white");
	$('#leftColumn').css('background-color',"");
	$('#rightColumn').css("background-color","");
	$('#leftColumn').css("border-style","");
	$('#rightColumn').css("border-style","");
	$('#fieldOption').val("job_field");
	$('#stateOption').val("location");
	
    $('#fm').css('display','inline');
    $('#p0').css('display','inline');
    $('#p0').html('');
    $('#p1').css('display','block');
    $('#a0').hide();
    $('#fm1').hide();
    $('#fm2').hide();
    $('#fm3').hide();
    $('#userList').hide();
    $('#jobList').hide();
    $('#editJob').hide();
    $('#addJob').hide();
    $('#NewUser').show();
    $('#admin').hide();
    $("#searchField").hide();
    $('#dashboard').hide();
    $('#jobFrame').empty();
    $('#jobFrame').hide();
    $("#companyFrame").hide();
  });

  $("#newAcc1").click(function(){
    $( "#CreateUser" ).fadeIn( "slow" );
  });
  //If any new functions added, please add it below inside the ready block
  //..

 
  //handle user lists
  $("#a6").click(function(){
	$('#AdminUser').css('backgroundColor','#90EE90');
	$('#AdminJob').css('backgroundColor','#C0C0C0');
	$('#transbox1').hide();
    $('#fm').hide();
    $('#p1').hide();
    $('#p0').hide();
    $('#NewUser').hide();
    $('#jobList').hide(); 
    $('#editJob').hide();
    $('#addJob').hide();
    $('#recomFrame').hide();
    $('#a0').css('display','inline');
    $('#admin').css('display','block');
    $('#userTable').empty();
    $('#userList').show();
    var content ="";
    content +="<tr>";
    content +="<th>User ID</th><th>Name</th><th>Email</th><th>Address</th>";
    content +="</tr>";
    $('#userTable').append(content);
    //add content to userTable
    $.post("/haveUser", function(data){
      for(var row in data){
        appendUser(data[row]);
      }
    });
  });
  


  function appendUser(userInfo){
    var content ="";

    content +="<tr>";
    content +="<td>"+userInfo.NetID+"</td>";
    content +="<td>"+userInfo.FirstName+userInfo.LastName+"</td>";
    content +="<td>"+userInfo.Email+"</td>"
    content +="<td>"+userInfo.City+","+userInfo.State+"</td>";
    content +="</tr>";
    $('#userTable').append(content);
  }


  //handle job lists
  $("#a7").click(function(){
	$('#AdminJob').css('backgroundColor','#90EE90');
	$('#AdminUser').css('backgroundColor','#C0C0C0');
	$('#transbox1').hide();
    $('#fm').hide();
    $('#p1').hide();
    $('#p0').hide();
    $('#NewUser').hide();
    $('#userList').hide();
    $('#editJob').hide();
    $('#addJob').hide();
    $('#recomFrame').hide();
    $('#a0').css('display','inline');
    $('#admin').css('display','block');
    $('#jobTable').empty();
    $('#jobList').show();
    var content ="";
    content +="<tr>";
    content +="<th>Job ID</th><th>Job Title</th><th>Location</th><th>Minimum Degree</th><th>Actions</th>";
    content +="</tr>";
    $('#jobTable').append(content);
    //add content to jobTable
    $.post("/haveJob", function(data){
      for(var row in data){
        appendJob(data[row]);
      }
    });
  });


  function appendJob(jobInfo){
    var content ="";

    content +="<tr>";
    content +="<td>"+jobInfo.ID+"</td>";
    content +="<td>"+jobInfo.FIELD+"</td>";
    content +="<td>"+jobInfo.Location+"</td>";
    content +="<td>"+jobInfo.MinimumDegree+"</td>";
    content +="<td class=\"actions\"><a class=\"a9\" href=\"#\" id = \"edit"+jobInfo.ID+"\" onclick=\"editJobs()\" >Edit</a> &nbsp<a class=\"a10\" href=\"#\" id = \"delete"+jobInfo.ID+"\">Delete</a></td>";
    content +="</tr>";
    $('#jobTable').append(content);
  }

  //handle admin delete job from job list, the delete class is added dynamically, can't use $(.a10).click(function())
  $('#jobTable').on('click', 'a.a10', function(){
    var id = ($(this).attr("id")).slice(6); 
    $.post("/deleteJob",{jobID: id}).done(function(data){
      if(data=='true'){
        $('#a7').trigger( "click" );
      }
      else{
        alert("You can't delete job, try later!");
      }
    });
    
  });

  //handle admin edit job from job list
  $('#jobTable').on('click', 'a.a9', function(){
    var id = ($(this).attr("id")).slice(4);
    $('#jobList').hide();
    $('#editJob').show();
    $('#addJob').hide();
    $('#recomFrame').hide();
    $('.JobUpdate').html("Edit Jobs");
    $.post("/jobInfo", {jobID: id}).done(function(data){
      $("#jobID").val(data[0].ID);
      $("#jobTitle").val(data[0].FIELD);
      $("#jobCom").val(data[0].Company);      
      $("#jobLoc").val(data[0].Location);
      $("#jobDeg").val(data[0].MinimumDegree);
      $("#jobDes").val(data[0].Description);
    }); 
  });

  //when save is clicked, update job informatin in db
  $("#saveJob").click(function(){

    var jobID = $("#jobID").val();
    var jobTitle = $("#jobTitle").val();
    var jobCom = $("#jobCom").val();
    var jobLoc = $("#jobLoc").val();
    var jobDeg = $("#jobDeg").val();
    var jobDes = $("#jobDes").val();

    $.post("/editJobInfo",{ID: jobID, Title: jobTitle, Company: jobCom, Location: jobLoc, Degree: jobDeg, Description: jobDes}).done(function(data){
      if(data=='true'){
        alert("Save job information successfully!")       
      }else{
        alert("Can not save job information, try later!");
      }
      
    });
  });    

  $("#back").click(function(){
    $('#a7').trigger( "click" );

  });



  //handle admin add job into job list
  $("#Adding").click(function(){
    $('#jobList').hide();
    $('#recomFrame').hide();
    $('.jobInput').val("");
    $('#addJob').show();
	$('.JobUpdate').html("Add Jobs");
  });

  //when save is clicked, add job informatin in db
  $("#addsaveJob").click(function(){

    var jobID = $("#addjobID").val();
    var jobTitle = $("#addjobTitle").val();
    var jobCom = $("#addjobCom").val();
    var jobLoc = $("#addjobLoc").val();
    var jobDeg = $("#addjobDeg").val();
    var jobDes = $("#addjobDes").val();
    var jobLink = $("#addjobLink").val();

    $.post("/addJobInfo",{ID: jobID, Title: jobTitle, Company: jobCom, Location: jobLoc, Degree: jobDeg, Description: jobDes, Link: jobLink}).done(function(data){
      if(data=='true'){
        alert("Save job information successfully!")       
      }else{
        alert("Can not save job information, job ID exists!");
      }
      
    });

  });  

  $("#addback").click(function(){
    $('#a7').trigger( "click" );

  });


  //Sortable job recommandation 
  var sortHelper = {};
  $( "#sortableSkill" ).sortable({ 
    placeholder: "ui-sortable-placeholder" ,
    update: function(event, ui) {
      $("#recJobList").empty();
      var skillArray = $("#sortableSkill").sortable('toArray', {attribute: 'data-skill'});
      for(var skill in skillArray){
        if(skillArray[skill] in sortHelper){
          for(var row in sortHelper[skillArray[skill]])
            appendJobFmII(sortHelper[skillArray[skill]][row], "#recJobList");
        }
      }
    }
  });
  function appendJobFmII(jobInfo, fmID){
    var content = "";
    var jobId = jobInfo.ID;
    var jobTitle = jobInfo.FIELD;
    var companyName = jobInfo.Company;
    var jobLocation = jobInfo.Location;
    /*content += "<div class=\"jobTab\" id=\"job"+jobId+"\">";
    content += "<p><a href=\"#\" class=\"jobTitle\" onclick=\"$(this).jobPage('"+jobId+"')\">" +jobTitle+ "</a></p>";
    content += "<p><a href=\"#\" class=\"jobCompany\" onclick=\"$(this).companyPage('"+companyName+"')\">" +companyName+ "</a></p>";
    content += "<p class=\"jobLocation\">" + jobLocation + "</p>";
    content += "</div><br>";*/
    content += "<p><span id=\"jobSkill\">" + jobInfo.skill + "</span>&nbsp&nbsp&nbsp";
    content +="<a href=\"#\" class=\"jobTitle\" onclick=\"$(this).recjobPage('"+jobId+"')\">" + jobTitle+ ", " + companyName +"</a></p>";
    //content += "<li>"+ jobInfo.skill + " " + jobTitle + "</li>";
    $(fmID).append(content);    
  }

  $("#recommendJob").click(function(){
      $('#p1').hide();
      $('#fm2').hide();
      $('#fm3').hide();
      $("#companyFrame").hide();
      $('#userList').hide();
      $('#jobList').hide();
      $('#editJob').hide();
      $('#addJob').hide(); 
      $('#jobFrame').hide();
      $('#recJob').show();
      $('#recomFrame').show();
      $('#sortableSkill').empty();
      sortHelper = {};
	  var content1 = "";
	  content1 += "<p id=\"arrange\">Arrange skills according to your proficiency level</p>";
      $("#sortableSkill").append(content1); 
      $.post("/getSkillsByUser", function(data){
		
        for(var row in data){
          var content = "";
          var skillName = data[row].Skill;
          content += "<li data-skill=\""+skillName+"\" class=\"ui-state-default\">" + skillName + "<a href=\"#\" class=\"delete\"><img src=\"delete1.png\"></a>" + "</li>";
          $("#sortableSkill").append(content); 
        }
      });

      updateRecPage();
    });

    function updateRecPage() {
     $.post("/recJobs", function(data){
        for(var i in data){
          if(!(data[i].skill in sortHelper)){
            sortHelper[data[i].skill] = [];
          }
          sortHelper[data[i].skill].push(data[i]); 
        }
        $("#recJobList").empty();
        var skillArray = $("#sortableSkill").sortable('toArray', {attribute: 'data-skill'});
        for(var skill in skillArray){
          if(skillArray[skill] in sortHelper){
            for(var row in sortHelper[skillArray[skill]])
              appendJobFmII(sortHelper[skillArray[skill]][row], "#recJobList");
          }
        }
      });    
   }
  

  //handle sortableskill delete dynamic generated 
  $('#sortableSkill').on('click', '.delete', function() {
    $(this).parent().remove();
    updateRecPage();
  });



  //handle rec job page
  $.fn.recjobPage = function(jobID){
    $.post("/jobInfo",{jobID: jobID}).done(function(data){
      var content = "";
      var Field = data[0].FIELD;
      var Description = data[0].Description;
      var MinimumDegree = data[0].MinimumDegree;
      var Location = data[0].Location;
      var Link = data[0].Link;
      var count =1;

      content += "<fieldset>" + "<legend>About this job</legend>";
      content += "<div class=\"jobHeader\" id=\""+jobID+"Info\">";
      content += "<b>"+Field+ "</b><br>";
      content += "<div style=\"font-size:14px\">Location: "+Location+"</div>";
      content += "</div>";
      content += "<b style=\"color:#A9A9A9\">Job Description: </b>";
      content += "<p>" + Description + "</p>";
      content += "<b style=\"color:#A9A9A9\">Minimum Degree:</b> " +MinimumDegree+"<br>";
      content += "<b style=\"color:#A9A9A9\">Recommended Interview Questions </b>";
      content += "<a id=\"RecQuestion\" href=\"#\">show</a>";
      content += "<a id=\"applyForJob\" href=\"" + Link+"\" target=\"_blank\">Apply Now</a>";
      content += "<div id=\"Questions\">"
      for(var row in data){
         content +="<p>"+count+". " + data[row].Question + "</p>";
         count = count+1;
      }
      content +="</div>";
      //content += "<div id=\"Questions\"><p>1. Find number of ones in an integer.</p><p>2. Print out, from small to big, of a sequence intergers, without sorting.</p></div>";
      content += "</fieldset>"

      $('#p1').hide();
      $('#fm2').hide();
      $('#fm3').hide();
      $("#companyFrame").hide();
      $('#userList').hide();
      $('#jobList').hide();
      $('#editJob').hide(); 
      $('#addJob').hide();
      $('#recomFrame').hide();     
      $('#jobFrame').empty();
      $('#jobFrame').show();
      $("#jobFrame").html(content);
      $("#RecQuestion").click(function(){
        DisplayQuestion();
      });
    });
  }

});