$(document).ready(function(){
  //This part of code handle username and password
  var user,pass;
  $("#submit").click(function(){
    user=$("#user").val();
    pass=$("#password").val();
    $.post("http://localhost:3000/login",{user: user,password: pass}, function(data){
      if(data==='done')
        {
          alert("login success");
        }
    });
  });
  //If any new functions added, please add it below inside the ready block
  //..
});