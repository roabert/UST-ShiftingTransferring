package ust.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ust.ejb.MailSender;

import org.apache.commons.lang3.RandomStringUtils;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
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

		String getEmail = request.getParameter("email_recovery");
		String key = RandomStringUtils.randomAlphabetic(5);
		MailSender mail = new MailSender();
		mail.sendEmail(key, getEmail);
        /*
        To Do:
        Use the request parameter to access the input values from the JSP
        Retrieve the user's field row using the given First Name and Last Name and Email Address
        CHECK FIRST IF THIS USER EXISTS
        If doesn't exist -> Inform user of wrong input
        If exist proceed ->
        Use the email input as the designated email to send the key
        Insert the key into the user's forgot_password_key field
        To Do Extra if may time:
        Add an expiry time for the key
        */
	}

}
