package com.vetbuddy.util;

import java.util.Calendar;

import javax.print.CancelablePrintJob;

public class CMS {
	
	
	
	
	public static String getAppointmentConfirmCMS(String dname,String ownername,String date) {
		
		String emailTemplate = "<!DOCTYPE html>\n" +
		        "<html>\n" +
		        "<head>\n" +
		        "  <title>Appointment Confirmation</title>\n" +
		        "</head>\n" +
		        "<body style=\"font-family: Arial, sans-serif;\">\n" +
		        "\n" +
		        "  <h1 style=\"color: #333; text-align:center\">Appointment Confirmation</h1>\n" +
		        "\n" +
		        "  <p>Dear {{oname}},</p>\n" +
		        "\n" +
		        "  <p>We are pleased to confirm your appointment with {{dname}} on {{appointment_date}}.</p>\n" +
		        "\n" +
		        "  <table style=\"border-collapse: collapse; width: 100%;\">\n" +
		        "    <tr>\n" +
		        "      <td style=\"border: 1px solid #ccc; padding: 8px;\">Doctor:</td>\n" +
		        "      <td style=\"border: 1px solid #ccc; padding: 8px;\">{{dname}}</td>\n" +
		        "    </tr>\n" +
		        "    <tr>\n" +
		        "      <td style=\"border: 1px solid #ccc; padding: 8px;\">Appointment Date:</td>\n" +
		        "      <td style=\"border: 1px solid #ccc; padding: 8px;\">{{appointment_date}}</td>\n" +
		        "    </tr>\n" +
		        "    <!-- Include other appointment details as needed -->\n" +
		        "  </table>\n" +
		        "\n" +
		        "  <p>Thank you,<br>\n" +
		        "   {{dname}}</p>\n" +
		        "\n" +
		        "</body>\n" +
		        "</html>";
		
		emailTemplate = emailTemplate.replace("{{dname}}",dname);
		emailTemplate = emailTemplate.replace("{{oname}}",ownername);
		emailTemplate = emailTemplate.replace("{{appointment_date}}",date);
		
		return emailTemplate;

		
	}

	
	public static  String getCancelAppointmentCms(String dname,String oname) {
		
		
		 String cancelTemplate = "<html lang=\"en\">\n" +
	                "<head>\n" +
	                "  <meta charset=\"UTF-8\">\n" +
	                "  <title>Veterinary Clinic Appointment Cancellation</title>\n" +
	                "</head>\n" +
	                "<body>\n" +
	                "  <div>\n" +
	                "    <h4>Dear {{oname}},</h4>\n" +
	                "\n" +
	                "    <p>We regret to inform you that your appointment with Dr.{{dname}} at our veterinary clinic has been canceled due to unforeseen circumstances.</p>\n" +
	                "\n" +
	                "    <p>We apologize for any inconvenience this may cause and assure you that we are working diligently to reschedule your appointment at the earliest convenience.</p>\n" +
	                "\n" +
	                "    <p>Thank you for your understanding and continued support.</p>\n" +
	                "\n" +
	                "    <p>Sincerely,</p>\n" +
	                "    <p>{{dname}}</p>\n" +
	                "  </div>\n" +
	                "</body>\n" +
	                "</html>";
		 
		 
		 cancelTemplate = cancelTemplate.replace("{{dname}}",dname);
		 cancelTemplate = cancelTemplate.replace("{{oname}}",oname);
		 
		 return cancelTemplate;
	}
	
	public static String getTemplateFromCMS(String doctor,String email,String password)
	{
		
		
		 String retrievedTemplateFromCMS =
	                "<!DOCTYPE html>\n"
	                + "<html>\n"
	                + "<head>\n"
	                + "    <title>Your Email Template</title>\n"
	                + "</head>\n"
	                + "<body>\n"
	                + "<h2>Dear {{doctor}} ,</h2>\n"
	                + "<p>We are pleased to inform you that your VetBuddy account has been successfully verified!</p>\n"
	                + "<p>Your dedication to joining our esteemed veterinary community is greatly appreciated. As promised, here are your login details:</p>\n"
	                + "<p><b>Username:<b/> {{email}} </p>\n"
	                + "<p><b>Password:</b>{{password}} </p>\n"
	                + "<p>We are excited to have you as a verified member of VetBuddy, where your expertise will benefit pet owners and their beloved companions. If you encounter any issues logging in or have any queries, please feel free to reach out to our support team at vetbuddysupport@gmail.com.</p>\n"
	                + "<p>Thank you for choosing VetBuddy. We look forward to fostering a thriving community dedicated to excellent veterinary care.</p>\n"
	                + "<h3>Best regards,</h3>\n"
	                + "<h4>Rahul Barhate</h4>\n"
	                + "<p>VetBuddy Team</p>\n"
	                + "</body>\n"
	                + "</html>";
		 
		 
		 //process the CMS
		  String processTemplate = retrievedTemplateFromCMS.replace("{{doctor}}",doctor); 
		                           processTemplate = processTemplate.replace("{{email}}",email);
		                           processTemplate = processTemplate.replace("{{password}}",password);
		 
		return processTemplate;
	}
}
