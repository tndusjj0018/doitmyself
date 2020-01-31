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
//				//�ι�° ���� true�� ��Ƽ ��Ʈ �޽����� ����ϰڴٴ� �ǹ��Դϴ�.
//				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				helper.setFrom(vo.getFrom());
//				helper.setTo(vo.getTo());
//				helper.setSubject(vo.getSubject());
//				
//				//1. ���ڷθ� �����ϴ� ���
//				helper.setText(vo.getContent(), true);
//			}
//		};
//		
//		mailSender.send(mp); //���� �����մϴ�.
//		System.out.println("���� �����߽��ϴ�.");
//	}
//}