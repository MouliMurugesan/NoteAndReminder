<html>  
<head>
<title>
Registration
</title>
</head>
<body>  
<center>
<form  name="myForm"action="RegistrationServlet" method="post"  onsubmit="return validation() "id="container">  
  <h1>Registration</h1>
<h3>Name</h3>
<input type="text" name="userName" required/>
<h3>Email Id</h3>
<input type="email" name="userEmail"required/>  
<h3>Mobile No</h3>
<input type="number" name="mobno"required/>
<h3>Password</h3>
<input type="password" name="userPass" minlength="8" required/> 
<h3>Confirm Password</h3>
<input type="password" name="conPass" minlength="8" required/>
<input type="submit" value="register"/>  
  
</form>  
</center>
<style>
#container {

  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  Width:25%;
  text-box:center;
   text-align:left;
   margin-top:5%;
   
}
#container input[type=text] ,input[type=password],input[type=number],input[type=email]{
  width: 90%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;

 
}
 #container input[type=submit] {
  background-color: black;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  
  margin-top:3%;
  margin-left:20%;
  width:60%;

  
}
#container input[type=button]{
background-color: black;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right:10%;
}
#container h1
{
text-align:center;
}
</style>
<script type="text/javascript">
function validation()
{
	 var x = document.forms["myForm"]["userEmail"].value;
	 var pass = document.forms["myForm"]["userPass"].value;
	 var conpass = document.forms["myForm"]["conPass"].value;
	 var mailformat = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/;
	 
	 if(pass!=conpass)
		 {
		 alert("password not matched");
		 return false;
		 }
	 return true;
	}
</script>
</body>  
</html>  