<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import ="com.NoteAndRemainder1.DAO.ConnectionDb" %>
    <%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
String notebookname=request.getParameter("notebookName");
String discription=request.getParameter("discription");
int id=(int)session.getAttribute("id");
Connection con=ConnectionDb.getConnection();
String query="Insert into notebook(notebookname,reg_id,description) values(?,?,?)";
PreparedStatement pt = con.prepareStatement(query);
pt.setString(1,notebookname );
pt.setInt(2,id);
pt.setString(3, discription);
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