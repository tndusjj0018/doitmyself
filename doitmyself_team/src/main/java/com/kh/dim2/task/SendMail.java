package com.kh.dim2.task;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.kh.dim2.domain.Mail;


@Component
public class SendMail {
	
	 @Autowired
     protected JavaMailSender  mailSender;
	 
     public void SendEmail(Mail mail) throws Exception {
          
         MimeMessage msg = mailSender.createMimeMessage();
         System.out.println("****���ϼ��� ??");
         try {
             msg.setSubject(mail.getSubject());
             msg.setText(mail.getContent());
             msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(mail.getReceiver()));
            
         }catch(MessagingException e) {
             System.out.println("MessagingException");
             e.printStackTrace();
         }
         try {
             mailSender.send(msg);
         }catch(MailException e) {
             System.out.println("MailException�߻�");
             e.printStackTrace();
         }
     }
}