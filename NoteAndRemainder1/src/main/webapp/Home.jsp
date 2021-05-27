<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import ="com.NoteAndRemainder1.DAO.ConnectionDb" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Menu_Style.css"/>
<link rel="stylesheet" href="Home.css"/>

<title>Home</title>
</head>
<body>
<%

String username= (String)session.getAttribute("user");
int id=0;
if (username==null)
{
	response.sendRedirect("Login.jsp"); 
}
else
{
	
	String idc;
	id=(int)request.getSession().getAttribute("id");

}
	Connection con=ConnectionDb.getConnection();
	
	String query="Select notebook_id,notebookname,description from notebook where reg_id=?";
	PreparedStatement pt = con.prepareStatement(query);
	pt.setInt(1,id);
	ResultSet rs=pt.executeQuery();


%>
<div class=line>
<div id="main">

  <button class="openbtn" onclick="openNav()">  Menu</button><a href="Login.jsp"><button class="Logout">Logout</button></a>
 <a href="remind.jsp"><img src="reminder.png" alt="Flowers in Chania"  id="remind" ><img src="noreminder.png" alt="no"  id="noremind" ></a>
  
  
  
  
  
  </div></div>
<div id="mySidebar" class="sidebar">
  <class="closebtn" onclick="closeNav()">
  <h3><a href="#"><% out.println(username);%></a></h3>
  <a href="#"></a>
  <a href="Home.jsp">Home</a>
  <a href="AllNotes.jsp">All Notes</a>
</div>
<div class="home">

<button id="cretbtn" onclick="document.getElementById('container').style.display = 'block';">Create</button>
<div id="container">
  <form action="NoteBook.jsp"  method="post">
    <h1>Create NoteBook</h1>
    <h3>Name</h3>
    <input type="text" name="notebookName" required>
    <h3>Description</h3>
    <input type="text" name="discription" required>
    <input type="submit" name="sub" value="Create">
   <input type="button" name="close" value="Close" onclick="document.getElementById('container').style.display = 'none';">

    
  </form>

</div>

<p id="title">NoteBook</p>
<%

%>
<center>
<table class="table">
<% while(rs.next()) 
{
%>
<tr>
<td><a href="Notes.jsp?nid=<%=rs.getInt("notebook_id")%>"><div id="td" ><%=rs.getString("notebookname")%> </div></a>
<div id="discp"><%=rs.getString("description")%></div>
</td>
<td>
<a href ="Notes.jsp?nid=<%=rs.getInt("notebook_id")%>"><button id="nbt">Edit</button></a></td> 
<td><a href ="delete.jsp?nid=<%=rs.getInt("notebook_id")%>"><button id="nbt">Delete</button></a></td>
</tr>

<%} %>
<%con.close(); %>
</table>
</center>
</div>
<%

        
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         String d1 = df.format(new Date());
         Date date=df.parse(d1);
         Connection con1=ConnectionDb.getConnection();
         String querys="Select note_id from note where usr_id=? and remind_date=?";
         PreparedStatement pts = con1.prepareStatement(querys);
     	pts.setInt(1,id);
     	pts.setDate(2,new java.sql.Date(date.getTime()));
     	ResultSet rss=pts.executeQuery();
     	if(rss.next())
     	{%>
     	<script>
     	document.getElementById("remind").style.display = "block";
     	document.getElementById("noremind").style.display = "none";
     	</script>
     		
     	<% }
     	con1.close();
      %>


<script>
var check=1;
function openNav() {
	if(check===1)
		{
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	  check=0;
		}
	else
		{
		document.getElementById("mySidebar").style.width = "0";
		  document.getElementById("main").style.marginLeft= "0";
		  check=1;
		}
	  
	  
	}
	


</script>
<style>

#container {
	display:none;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  Width:60%;
  text-box:center;
   position: fixed;
}
#container input[type=text] ,input[type=date]{
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
  margin-right:40%;
}
#main #remind
{
	max-width:30px;
	max-height:auto;
	display:none;
	margin-top:0.5%;
	float:right;
	position:relative;
	cursor: pointer;
	margin-right:5%;
	
}
#noremind
{max-width:30px;
	max-height:auto;
	
	margin-top:0.5%;
	float:right;
	position:relative;
	cursor: pointer;
	margin-right:5%;
	
}
#nbt
{
	
	font-size:15px;
  cursor: pointer;
  background-color: black;
  color: white;
  padding: 5px 5px;
  border: none;
  border-radius: 2px;
 
}
table
{
	border-collapse: collapse;
	width:60%;
	column-gap:0px;
	font-size:20px;
	
	
	color: black;
}
th, td{
  text-align: left;
  padding: 8px;

  
}

tr:nth-child(even){background-color: #f2f2f2;
  border-radius: 100px;
}


</style>
</body>
</html>