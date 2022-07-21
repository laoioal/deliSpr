package com.githrd.deli.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class YonghyunMail {

	//@Autowired
	//private JavaMailSender mailSender;
	
	@Autowired
	private JavaMailSenderImpl mailSender;	
	
	@RequestMapping(value = "/sendMail.do")
	public String sendMail() {

	    final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            helper.setFrom("dktldkgoddh@naver.com");
	            helper.setTo("dktldkgoddh@naver.com");
	            helper.setSubject("test");
	            helper.setText("test", true);
	        }
	    };

	    mailSender.send(preparator);

	    return "result";
	}

	
}
