<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ page import = "java.sql.*" %>
  <%@ page import = "ust.registrar.utility.*" %>
  <%@ page import = "DatabaseHandler.SingletonDB" %>
  
  <% Connection conn = SingletonDB.getConnection(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<%

  logout logout = new logout(); 
  String getuser = request.getParameter("userset");
  String event = "Log out authentication";
  String description = "This user has been logged out";
   
  logout.setUserid(getuser);
  logout.setEvent(event);
  logout.setDescription(description);
  logout.insertLogs(conn);
  
  request.getSession().invalidate();

   response.sendRedirect("login.jsp"); 
 
%>
</body>
</html>