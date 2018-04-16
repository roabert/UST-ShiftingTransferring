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

 /**  String ofad = (String)session.getAttribute("ofaduser");
  String admin = (String)session.getAttribute("administrator");
  String dean = (String)session.getAttribute("deanuser");
  String osg = (String)session.getAttribute("secgenuser");
  String osa = (String)session.getAttribute("osauser");
  String regis = (String)session.getAttribute("registraruser");
  String shift = (String)session.getAttribute("shifteruser");
  String trans = (String)session.getAttribute("setuser"); */
 
  String event = "Log out authentication";
  String description = "This user has been logged out";
   
  //if(ofad != null || admin != null || dean != null || osg != null || osa != null || regis != null || shift != null || trans != null) {
   /** l.setUserid(ofad);
    l.setUserid(admin);
    l.setUserid(dean);
    l.setUserid(osg);
    l.setUserid(osa);
    l.setUserid(regis);
    l.setUserid(shift);
    l.setUserid(trans); */
   
   
    /** setUserid(getuser);
    l.setEvent(event);
    l.setDescription(description);
    l.insertLogs(conn);
  */     
  
  request.getSession().invalidate();

   response.sendRedirect("login.jsp"); 
  //}
%>
</body>
</html>