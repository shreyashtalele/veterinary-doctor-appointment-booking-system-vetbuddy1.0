package com.vetbuddy.util;
import java.util.Properties;


import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailSender {

	private EmailSender() {
		
	}
	public static boolean sendEmails(String to,String from,String subject ,String text)
	{
		boolean flag=false;
		
		 try {
			 
		    Properties properties  = new Properties();
		    properties.put("mail.smtp.auth",true);
		    properties.put("mail.smtp.starttls.enable",true);
		    properties.put("mail.smtp.port","587");
		    properties.put("mail.smtp.host","smtp.gmail.com");
		
		    final String username = "vetbuddyinfo@gmail.com";
		    final String password = "dklbmjmgdxoscjwd";
		
		    Session session =  Session.getInstance(properties,new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(username, password);
			}
		});
		
		
		
//		  For Sending to Multiple Email We use the Array of internetAddress
		
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
			message.setSubject(subject);
			message.setContent(text,"text/html");
		    Transport.send(message);
		    flag = true;
			
			
		}catch (MessagingException e) {
			e.printStackTrace();
			flag = false;
		}
		catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}
}





  
	
	

       
    


