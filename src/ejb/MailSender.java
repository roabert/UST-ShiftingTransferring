package ejb;

import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class MailSender {

    public void sendEmail(String message){
    
    	
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
           mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress("trebavena@gmail.com"));
           mailMessage.setText(message);
           mailMessage.setSubject("HEY!");
           
           Transport transport = mailSession.getTransport("smtp");
           transport.connect("smtp.gmail.com","ustshiftdummy@gmail.com","UST1232018");
           
           transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
       	} catch (Exception ex) {
            Logger.getLogger(MailSender.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }	
	
}
