//User name and Password
var users = ["1"];
var password = ["1"];

function toggleMenu(objID) {
	var obj = document.getElementById(objID).style;
	obj.display = (obj.display == 'block'?'none': 'block');
}


function login(){
	loadXMLDoc();
	if(document.getElementById("username").value == users[0]){
		if(document.getElementById("password").value == password[0]){
			window.location="login.html";
		}
		else{
		document.getElementById("p2").innerHTML = "Invalid password";
		}
	}
	else{
		document.getElementById("p2").innerHTML = "Invalid username";
	}
}

function accProfile(){
	var accProfile = document.getElementById("fm2").style;
	var accUpdate = document.getElementById("fm3").style;
	accProfile.display = 'block';
	accUpdate.display = 'none';	
}

function accUpdate(){
	var accProfile = document.getElementById("fm2").style;
	var accUpdate = document.getElementById("fm3").style;
	accProfile.display = 'none';
	accUpdate.display = 'block';
}

function save(){
	var FN = document.getElementById('firstName').value;
	var LN = document.getElementById('lastName').value;
	document.getElementById('acc_name').innerHTML = FN + " " + LN;
	
	var birthday = document.getElementById('birthday').value;
	document.getElementById('acc_birthday').innerHTML = birthday;
	
	var email = document.getElementById('email').value;
	document.getElementById('acc_email').innerHTML = email;
	
	var phone = document.getElementById('phone').value;
	document.getElementById('acc_phone').innerHTML = phone;
	
	var major = document.getElementById('major').value;
	document.getElementById('acc_major').innerHTML = major;
	
	var address = document.getElementById('address').value;
	var city = document.getElementById('city').value;
	var state = document.getElementById('state').value;
	document.getElementById('acc_address').innerHTML = address+" "+city+" "+state;
	
	var skills = document.getElementById('fm3');
	var others = document.getElementById('others').value;
	var txt = "";
    var i;
    for (i = 0; i < skills.length; i++) {
        if (skills[i].checked) {
            txt = txt + skills[i].value + " ";
        }
    }
	document.getElementById('acc_skills').innerHTML = txt +" "+others;
}

//Send http requst to Server
function loadXMLDoc()
{
    var xmlhttp;
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    //The function below handles the changes of the website after receiveing response from server
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            //Modify the website here.
            document.getElementById("docs").innerHTML += xmlhttp.responseText;
            //updatepage(xmlhttp.responseText);
        }
    }

    xmlhttp.open("POST","/USER",true);
    xmlhttp.send("data");
}