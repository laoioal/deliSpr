package com.githrd.deli.controller;


/**
 * @author	이용현
 * @since	2022/05/25
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.25	-	클래스제작
 * 								담당자 : 이용현
 */

import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.githrd.deli.dao.*;
import com.githrd.deli.vo.*;

import java.util.ArrayList;
import java.util.regex.*;
import javax.websocket.*;
import java.util.*;


@ServerEndpoint("/main.dlv")
public class Chat {
	

	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
	@OnOpen
	public void ChatStart(Session userSession) {
		sessionUsers.add(userSession);
System.out.println("접속성공");
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) throws Exception {
		//System.out.println(message);
		String name = "";
		Matcher matcher = pattern.matcher(message);
		if (matcher.find()) {
			name = matcher.group();
		}
		String msg = message.replaceAll(pattern.pattern(), "");
		String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
		YonghyunDao yDao = new YonghyunDao();
		ChatVO chVO = new ChatVO();
		
	
		sessionUsers.forEach(session -> {
			if (session == userSession) {
				return;
			}
			try {
			session.getBasicRemote().sendText(username + " : " + msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}

	@OnClose
	public void ChatEnd(Session userSession) {
	sessionUsers.remove(userSession);
	}
}

