<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html>
<html>
<!-- Add jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet" href="fancybox/source/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js"></script>

<link rel="stylesheet" href="fancybox/source/helpers/jquery.fancybox-thumbs.css" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-thumbs.js"></script>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File</title>
    </head>
    
    <body>
        <form method="post" action="UploadFileController" enctype="multipart/form-data">
			Upload File:<input type="file" name="req1" /><br>
			Upload File:<input type="file" name="req2" /><br>
			Upload File:<input type="file" name="req3" /><br>
			Upload File:<input type="file" name="req4" /><br>
			Upload File:<input type="file" name="req5" /><br>
			Upload File:<input type="file" name="req6" /><br>
			<input type="submit" value="Upload">
        </form>
        
        <br><br>
        
        <table border="1" width="25%" cellpadding="5">
            <thead> 
               <th colspan="3">Uploaded Files</th>        
            </thead>
                <tbody>
                    <tr>
                        <td><center><b>Id</b></center><td><center><b>Title</b></center></td><td><center><b>File</b></center></td>
                    </tr>
                    
                    <%
                        try
                        {
                               

                                String sqlString = "SELECT * FROM files";
                                Statement myStatement = conn.createStatement();
                                ResultSet rs=myStatement.executeQuery(sqlString);
                                
                                if(!rs.isBeforeFirst())
                                {
                                    %>
                                        <tr>
                                        <td colspan="3"><center><%out.print("No Files!"); %></center></td>
                                        </tr>
                                    <%
                                }    
                                
                                while(rs.next())
                                {   
                            %>
                                    <tr>
                                        <td><center><%out.print(rs.getString("id")); %></center></td>
                                        <td><center><%out.print(rs.getString("title")); %></center></td>
                                        <td><center><a class="various fancybox.ajax" href="https://boards.4chan.org/co/catalog">View</a></center></td>
                                    </tr>
                            <%
                                }
                            %>
                            
                </tbody> 
        </table>
                            
                            <%
                                rs.close();
                                myStatement.close();
                               conn.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %>
        
  
    </body>
    
<script type="text/javascript">
	$(document).ready(function() {
		$(".various").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			openEffect	: 'none',
			closeEffect	: 'none'
		});
	});
</script>
    
</html>