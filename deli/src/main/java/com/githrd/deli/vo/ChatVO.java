package com.githrd.deli.vo;

public class ChatVO {
	private String id, body;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "ChatVO [id=" + id + ", body=" + body + "]";
	}
	

}
