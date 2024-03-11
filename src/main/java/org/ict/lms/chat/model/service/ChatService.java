package org.ict.lms.chat.model.service;

import java.util.ArrayList;

import org.ict.lms.chat.model.vo.ChatList;
import org.ict.lms.chat.model.vo.ChatRooms;
import org.ict.lms.chat.model.vo.Chatting;

public interface ChatService {
	
	ArrayList<ChatList> selectChatroomList(String prof_code);
	
	ArrayList<ChatList> selectChattingList(String student_code);

	ChatRooms selectchatroom(String student_code);
	
	ChatRooms selectchatroom(ChatRooms chatRooms);

	int insertchat(Chatting chatting);

	void insertchatroom(String student_code);

	void insertchatroom(ChatRooms chatRooms);

	void updatetmsReadCount(ChatRooms crs);

	void updatesmsReadCount(ChatRooms crs);

	void updatewebsocketReadCount(Chatting chatting);





}
