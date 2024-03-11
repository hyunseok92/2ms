package org.ict.lms.chat.model.vo;

import java.io.Serializable;

public class ChatRooms implements Serializable {
	private static final long serialVersionUID = -2387539775170454329L;
	
	private String chat_room;
	private String prof_code;
	private String student_code;
	private String prof_name;
	private String student_name;
	private String last_chat;
	
	public ChatRooms() {
		super();
	}
	public ChatRooms(String chat_room, String prof_code, String student_code, String prof_name, String student_name,
			String last_chat) {
		super();
		this.chat_room = chat_room;
		this.prof_code = prof_code;
		this.student_code = student_code;
		this.prof_name = prof_name;
		this.student_name = student_name;
		this.last_chat = last_chat;
	}
	public String getChat_room() {
		return chat_room;
	}
	public void setChat_room(String chat_room) {
		this.chat_room = chat_room;
	}
	public String getProf_code() {
		return prof_code;
	}
	public void setProf_code(String prof_code) {
		this.prof_code = prof_code;
	}
	public String getStudent_code() {
		return student_code;
	}
	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getLast_chat() {
		return last_chat;
	}
	public void setLast_chat(String last_chat) {
		this.last_chat = last_chat;
	}
	
	
		
	
}
