package org.ict.lms.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Chatting implements Serializable {
	private static final long serialVersionUID = -3335902835157403726L;
	
	private String chat_room;
	private String chat_talker;
	private String chat_content;
	private String chat_time;
	private int chat_readcount;
	private Date chat_date;
	private String chat_talker_name;
	public Chatting() {
		super();
	}
	public Chatting(String chat_room, String chat_talker, String chat_content, String chat_time, int chat_readcount,
			Date chat_date, String chat_talker_name) {
		super();
		this.chat_room = chat_room;
		this.chat_talker = chat_talker;
		this.chat_content = chat_content;
		this.chat_time = chat_time;
		this.chat_readcount = chat_readcount;
		this.chat_date = chat_date;
		this.chat_talker_name = chat_talker_name;
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
	@Override
	public String toString() {
		return "Chatting [chat_room=" + chat_room + ", chat_talker=" + chat_talker + ", chat_content=" + chat_content
				+ ", chat_time=" + chat_time + ", chat_readcount=" + chat_readcount + ", chat_date=" + chat_date
				+ ", chat_talker_name=" + chat_talker_name + "]";
	}
	
	
}
