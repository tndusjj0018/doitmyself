//package com.kh.dim2.task;
//
//import javax.mail.internet.MimeMessage;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.mail.javamail.MimeMessagePreparator;
//import org.springframework.stereotype.Component;
//
//import com.kh.dim2.domain.Mail;
//
//
//@Component
//public class SendMail {
//	
//	//@Autowired
//	private JavaMailSenderImpl mailSender;
//	
//	@Value("${sendfile}")
//	private String sendfile;
//	
//	public void sendMail(Mail vo) {
//		MimeMessagePreparator mp = new MimeMessagePreparator() {
//			
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//
//				//두번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
//				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				helper.setFrom(vo.getFrom());
//				helper.setTo(vo.getTo());
//				helper.setSubject(vo.getSubject());
//				
//				//1. 문자로만 전송하는 경우
//				helper.setText(vo.getContent(), true);
//			}
//		};
//		
//		mailSender.send(mp); //메일 전송합니다.
//		System.out.println("메일 전송했습니다.");
//	}
//}