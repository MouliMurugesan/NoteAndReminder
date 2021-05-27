<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.Date"  %>
    <%@ page import ="java.text.SimpleDateFormat"  %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import ="com.NoteAndRemainder1.DAO.ConnectionDb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
java.sql.Date date1 = new java.sql.Date(0000-00-00);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
String Notes=request.getParameter("Notes");
Date Start_date=sdf.parse(request.getParameter("startdate"));
Date End_date=sdf.parse(request.getParameter("enddate"));
Date Remaind_date=sdf.parse(request.getParameter("remainddate"));
int notebook_id=Integer.valueOf(request.getParameter("nid"));
int id=(int)request.getSession().getAttribute("id");
Connection con=ConnectionDb.getConnection();
String query="Insert into note(notes,notebook_id,start_date,end_date,remind_date,usr_id) values(?,?,?,?,?,?)";
PreparedStatement pt = con.prepareStatement(query);
pt.setString(1,Notes);
pt.setInt(2,notebook_id);
pt.setDate(3, new java.sql.Date(Start_date.getTime()));
pt.setDate(4, new java.sql.Date(End_date.getTime()));
pt.setDate(5, new java.sql.Date(Remaind_date.getTime()));
pt.setInt(6,id);
int check=pt.executeUpdate();
con.close();
if(check>0)
{
	response.sendRedirect("Notes.jsp?nid="+notebook_id); 
}
else
{
	response.sendRedirect("checksometiong.html"); 
	}


%>
</body>
</html>