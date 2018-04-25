package ust.registrar.utility;

import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.*;
import javax.mail.internet.*;

import DatabaseHandler.SingletonDB;

public class NotifSender {

	Connection conn = SingletonDB.getConnection();
	public String getEmail(String studentNum){
		String email = "";

		 try {
		 PreparedStatement ps1 = conn.prepareStatement("SELECT email FROM useraccounts WHERE userid = ?");
			ps1.setString(1, studentNum);
	  		ResultSet getEmail = ps1.executeQuery();
	  		while (getEmail.next()){
	  			email = getEmail.getString("email");
	  		}
			
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
		 
		return email;
	}

    public void sendNotif(String email){
    
    	
    	try{
    	   Properties props = System.getProperties();
           props.put("mail.smtp.host","smtp.gmail.com");
           props.put("mail.smtp.auth","true");
           props.put("mail.smtp.port","465");
           props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
           props.put("mail.smtp.socketFactory.port","465");
           props.put("mail.smtp.socketFactory.fallback","false");
           props.setProperty("mail.smtp.ssl.enable", "true");
           props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
           
           Session mailSession = Session.getDefaultInstance(props, null);
           mailSession.setDebug(true);
           
           Message mailMessage = new MimeMessage(mailSession);
           
           mailMessage.setFrom(new InternetAddress("ustshiftdummy@gmail.com"));
           mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(getEmail(email)));
           mailMessage.setText("New Update! Please check your tracker! 'Link nung website namin nakashare lang po domain namin pabago na lang STEPS' ");
           mailMessage.setSubject("Tracker Status Update for "+ email);
           Transport transport = mailSession.getTransport("smtp");
           transport.connect("smtp.gmail.com","ustshiftdummy@gmail.com","UST1232018");
           
           transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
       	} catch (Exception ex) {
            Logger.getLogger(NotifSender.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
	
}
