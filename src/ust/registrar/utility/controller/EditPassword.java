package ust.registrar.utility.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.utility.EditPasswordDAO;
import ust.registrar.utility.EncryptionTool;

/**
 * Servlet implementation class EditPassword
 */
@WebServlet("/EditPassword")
public class EditPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    Connection conn = null;
	public void init(ServletConfig config) throws ServletException {
		conn = SingletonDB.getConnection();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String getuser = request.getParameter("getuser");
		String getpassword = request.getParameter("change_password");
		String event = "Password Modification";
		String description = "This user has changed/modified his password.";
		
		EditPasswordDAO e =  new EditPasswordDAO();
	    e.setUserid(getuser);
	    e.setPassword(EncryptionTool.encrypt(getpassword));
	    e.setEvent(event);
	    e.setDescription(description);
	    e.checkPassword(conn);
	 if(!(EncryptionTool.encrypt(getpassword).equals(e.getGetpassword()))) {  
	  if(e.getType() != null) {
	    if(e.getType().equals("OFAD")) {
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Ofadpage.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	    else if(e.getType().equals("Dean")){
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Deanpage.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	    else if(e.getType().equals("OSG")){
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Osgpage.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	    else if(e.getType().equals("OSA")){
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Osapage.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	    else if(e.getType().equals("Registrar")){
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Registrarpage.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	    else if(e.getType().equals("Shifter")){
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Shifter-Welcome.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	    else if(e.getType().equals("Transferee")){
	    	 e.ModifyPasswords(conn);
	    	request.getRequestDispatcher("Transfer-Welcome.jsp").include(request, response);
	    	out.print("<script>alert('Your password has been successfully modified');</script>");
	    }
	   }
	}
	 else {
		 if(e.getType() != null) {
			    if(e.getType().equals("OFAD")) {
			
			    	request.getRequestDispatcher("Ofadpage.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			    else if(e.getType().equals("Dean")){
			    	
			    	request.getRequestDispatcher("Deanpage.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			    else if(e.getType().equals("OSG")){
			    	
			    	request.getRequestDispatcher("Osgpage.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			    else if(e.getType().equals("OSA")){
			    
			    	request.getRequestDispatcher("Osapage.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			    else if(e.getType().equals("Registrar")){
			    
			    	request.getRequestDispatcher("Registrarpage.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			    else if(e.getType().equals("Shifter")){
			
			    	request.getRequestDispatcher("Shifter-Welcome.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			    else if(e.getType().equals("Transferee")){
			    
			    	request.getRequestDispatcher("Transfer-Welcome.jsp").include(request, response);
			    	out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			    	out.print("<script>alert('You cannot change to your old password');</script>");
			    }
			   }
	 }
}

}
