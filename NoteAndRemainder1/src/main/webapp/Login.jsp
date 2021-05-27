<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<% session. invalidate();
%>

<center>

  <form action="LoginServlet"  method="post" id="container">
    <h1>Login</h1>
    <h3>Email</h3>
    <input type="text" name="userEmail" required/>
    <h3>Password</h3>
   <input type="password" name="userPass" required/>
    <input type="submit" value="Sign in"/>
     
  

   
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
   margin-top:10%;
   
}
#container input[type=text] ,input[type=password]{
  width: 90%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  margin-bottom:12px;
  margin-top:10px;
}
 #container input[type=submit] {
  background-color: black;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-left:40%;

  
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
</body>
</html>