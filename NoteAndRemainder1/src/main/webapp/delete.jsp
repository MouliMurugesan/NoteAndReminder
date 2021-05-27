<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import ="com.NoteAndRemainder1.DAO.ConnectionDb" %>
    <%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<
</head>
<body>
<%
String id=request.getParameter("nid"); 
int nid=Integer.valueOf(id);
Connection con=ConnectionDb.getConnection();
String query="delete from notebook where notebook_id=?";
PreparedStatement pt = con.prepareStatement(query);
pt.setInt(1,nid);

int check=pt.executeUpdate();
con.close();
if(check>0)
{
	response.sendRedirect("Home.jsp"); 
}
else
{
	response.sendRedirect("checksometiong.html"); 
	}
%>
</body>
</html>