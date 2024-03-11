package org.ict.lms.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

public class ChatList implements Serializable {
	private static final long serialVersionUID = -3588919378767469400L;
	
	private String chat_room;
	private String chat_talker;
	private String chat_content;
	private String chat_time;
	private int chat_readcount;
	private Date chat_date;
	private String chat_talker_name;
	private String student_name;
	private String prof_code;
	private String student_code;
	
	public ChatList() {
		super();
	}
	public ChatList(String chat_room, String chat_talker, String chat_content, String chat_time, int chat_readcount,
			Date chat_date, String chat_talker_name, String student_name, String prof_code, String student_code) {
		super();
		this.chat_room = chat_room;
		this.chat_talker = chat_talker;
		this.chat_content = chat_content;
		this.chat_time = chat_time;
		this.chat_readcount = chat_readcount;
		this.chat_date = chat_date;
		this.chat_talker_name = chat_talker_name;
		this.student_name = student_name;
		this.prof_code = prof_code;
		this.student_code = student_code;
	}
	public String getChat_room() {
		return chat_room;
	}
	public void setChat_room(String chat_room) {
		this.chat_room = chat_room;
	}
	public String getChat_talker() {
		return chat_talker;
	}
	public void setChat_talker(String chat_talker) {
		this.chat_talker = chat_talker;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_time() {
		return chat_time;
	}
	public void setChat_time(String chat_time) {
		this.chat_time = chat_time;
	}
	public int getChat_readcount() {
		return chat_readcount;
	}
	public void setChat_readcount(int chat_readcount) {
		this.chat_readcount = chat_readcount;
	}
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	public String getChat_talker_name() {
		return chat_talker_name;
	}
	public void setChat_talker_name(String chat_talker_name) {
		this.chat_talker_name = chat_talker_name;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
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
	@Override
	public String toString() {
		return "ChatList [chat_room=" + chat_room + ", chat_talker=" + chat_talker + ", chat_content=" + chat_content
				+ ", chat_time=" + chat_time + ", chat_readcount=" + chat_readcount + ", chat_date=" + chat_date
				+ ", chat_talker_name=" + chat_talker_name + ", student_name=" + student_name + ", prof_code="
				+ prof_code + ", student_code=" + student_code + "]";
	}
	
	
}
