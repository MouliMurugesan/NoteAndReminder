<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String username= (String)session.getAttribute("user");
if (username==null)
{
	response.sendRedirect("Login.jsp"); 
}
else
{
	int id=0;
	String idc;
	id=(int)request.getSession().getAttribute("id");

}%>
</body>
</html>