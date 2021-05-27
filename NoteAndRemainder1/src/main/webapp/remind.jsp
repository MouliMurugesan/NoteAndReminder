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
<title>Reminder</title>
</head>
<body>
<%
int id1=0;
String username = (String)session.getAttribute("user");

if(username==null)
{
	 response.sendRedirect("Login.jsp"); 
}
else
{
	

	id1=(int)request.getSession().getAttribute("id");
	
}

	

	

%>
<link rel="stylesheet" href="Menu_Style.css"/>
<link rel="stylesheet" href="Home.css"/>
<div class=line>
<div id="main">

  <button class="openbtn" onclick="openNav()">  Menu</button><a href="Login.jsp"><button class="Logout">Logout</button></a>
  
  
  
  
  
  </div></div>
<div id="mySidebar" class="sidebar">
  <class="closebtn" onclick="closeNav()">
  <h3><a href="#"><% out.println(username);%></a></h3>
  <a href="#"></a>
  <a href="Home.jsp">Home</a>
  <a href="AllNotes.jsp">All Notes</a>
</div>
<p id="title">Reminder</p>
<%

        
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         String d1 = df.format(new Date());
         Date date=df.parse(d1);
         Connection con1=ConnectionDb.getConnection();
         String querys="Select * from note where usr_id=? and remind_date=?";
         PreparedStatement pts = con1.prepareStatement(querys);
     	pts.setInt(1,id1);
     	pts.setDate(2,new java.sql.Date(date.getTime()));
     	ResultSet rss=pts.executeQuery();
     	%>
     	
     		<center>
 <table  class="Dbnotes">
 <tr>
    <th>Yours Notes</th>
    <th>Start Date</th>
    <th>End Date</th>
    <th>Status</th>
    
  </tr>
 <%while(rss.next())
{
%>
<tr>
<td><%=rss.getString("notes")%></td>
<td><%=rss.getString("start_date")%></td>
<td><%=rss.getString("end_date")%></td>
<td><%         SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
String dt1 = dft.format(new Date());
Date date1=dft.parse(dt1);

Date date2=rss.getDate("start_date");
Date date3=rss.getDate("end_date");
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
 </table>
 </center>
     	<%
     	con1.close();
      %>
</body>
<script type="text/javascript">
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
#title
{
	text-align:left;
	font-size: 30px;
	 font-weight: bold;
	 margin-left:10%;
	margin-top:5%;
	
}
table
{
	border-collapse: collapse;
	width:60%;
	column-gap:0px;
	font-size:20px;
	margin-top:2%;
	
	color: black;
}
th, td {
  text-align: left;
  padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}

</style>
</html>