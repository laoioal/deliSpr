package com.githrd.deli.service;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.deli.dao.EunbeeDao;
import com.githrd.deli.vo.EunbeeVO;

public class EunbeeService {
	@Autowired
	EunbeeDao eDao;
	
	public void sendMail(String mail, String npw) {
		String host = "smtp.naver.com"; 
		String user = "320aeb@naver.com";	// 네이버 계정
		String password = "dms3ql2dks0!";	// 네이버 패스워드
		
		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
			
			// 메일 제목
			message.setSubject("Delivery Project에서 임시비밀번호를 알려드립니다!");
			
			// 메일 내용
			message.setText("회원님의 임시비밀번호는 " + npw + " 입니다.");
			
			// send the message
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
