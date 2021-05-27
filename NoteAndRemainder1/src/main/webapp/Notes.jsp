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
<title>Notes</title>
<link rel="stylesheet" href="Menu_Style.css"/>
<link rel="stylesheet" href="Notes.css"/>

</head>
<body>
<div class=line>
<div id="main">

  <button class="openbtn" onclick="openNav()">  Menu</button>  
  <a href="Login.jsp"><button class="Logout">Logout</button></a>
   <a href="remind.jsp"><img src="reminder.png" alt="Flowers in Chania"  id="remind" ><img src="noreminder.png" alt="no"  id="noremind" ></a>
  
  </div></div>
  <%int id=0;
  String username= (String)session.getAttribute("user");
  if (username==null)
  {
  	response.sendRedirect("Login.jsp"); 
  }
  else
  {
  	
  	String idc;
  	id=(int)request.getSession().getAttribute("id");

  } %>
<div id="mySidebar" class="sidebar">
  <class="closebtn" onclick="closeNav()">
  <h3><a href="#"><% out.println(username);%></a></h3>
  <a href="#"></a>
  <a href="Home.jsp">Home</a>
  <a href="AllNotes.jsp">All Notes</a>
  
</div>

<div class="notes">
 <button id="btn" onclick="document.getElementById('container').style.display = 'block';">Add Notes</button>
 
<p id="title">Notes</p>
<%
 String ids=request.getParameter("nid"); %>
<div id="container">
 <form  name="myform" action="AddNotes.jsp?nid=<%=ids %>"  method="post" onsubmit=" return validate()">
 <b>Notes</b><br>
 <input type="text" name="Notes" required><br>
 <b>Start Date</b><br>
 <input type="date" name="startdate" required><br>
 <b>End Date</b><br>
 <input type="date" name="enddate" required><br>
 <b>Remaind Date</b><br>
 <input type="date" name="remainddate" required><br>
 
  <input type="submit" name="sub" value="ADD">
<input type="button" name="close" value="Close" onclick="document.getElementById('container').style.display = 'none';">
 
 </form>
 </div>
 <%
 
int nid=Integer.valueOf(ids);
 	Connection con=ConnectionDb.getConnection();
 	String query="Select * from note where notebook_id=?";
	PreparedStatement pt = con.prepareStatement(query);
	pt.setInt(1,nid);
	ResultSet rs=pt.executeQuery();
 %>
 <center>
 <table  class="Dbnotes">
 <tr>
    <th>Yours Notes</th>
    <th>Start Date</th>
    <th>End Date</th>
    <th>Status</th>
  </tr>
 <% while(rs.next()) 
{
%>
<tr>
<td><%=rs.getString("notes")%></td>
<td><%=rs.getString("start_date")%></td>
<td><%=rs.getString("end_date")%></td>
<td><%         SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
String dt1 = dft.format(new Date());
Date date1=dft.parse(dt1);

Date date2=rs.getDate("start_date");
Date date3=rs.getDate("end_date");
if(date1.compareTo(date3)>0)
{%>
	Ended
<%}
else if(date1.compareTo(date2)>0 || date1.compareTo(date2)==0)
{%>
Started
<%}
else
{%>
Not yet started<%}
%></td>
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
	function validate()
	{
		var d1 =document.forms["myform"]["startdate"].value;
		var d2=document.forms["myform"]["enddate"].value;
		var d3=document.forms["myform"]["remainddate"].value;
		if(d1>d2)
			{
			alert("invalide start and end date");
			return false;
			}
		return true;
		
			
		
		}
	</script>
	<style>
	#container {
	display:none;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  Width:70%;
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
	</style>
</body>
</html>