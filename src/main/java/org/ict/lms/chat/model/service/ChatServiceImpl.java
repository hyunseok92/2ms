package org.ict.lms.chat.model.service;

import java.util.ArrayList;

import org.ict.lms.chat.model.dao.ChatDao;
import org.ict.lms.chat.model.vo.ChatList;
import org.ict.lms.chat.model.vo.ChatRooms;
import org.ict.lms.chat.model.vo.Chatting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired private ChatDao chatDao;
	
	@Override
	public ArrayList<ChatList> selectChatroomList(String prof_code) {
		return chatDao.selectChatroomList(prof_code);
	}
	
	@Override
	public ArrayList<ChatList> selectChattingList(String student_code) {
		return chatDao.selectChattingList(student_code);
	}

	@Override
	public int insertchat(Chatting chatting) {
		return chatDao.insertchat(chatting);
	}

	@Override
	public ChatRooms selectchatroom(String student_code) {
		return chatDao.selectchatroom(student_code);
	}

	@Override
	public ChatRooms selectchatroom(ChatRooms chatRooms) {
		return chatDao.selectchatroom(chatRooms);
	}

	@Override
	public void insertchatroom(String student_code) {
		chatDao.insertchatroom(student_code);
	}

	@Override
	public void insertchatroom(ChatRooms chatRooms) {
		chatDao.insertchatroom(chatRooms);
	}
	
	@Override
	public void updatetmsReadCount(ChatRooms chatRooms) {
		chatDao.updatetmsReadCount(chatRooms);		
	}

	@Override
	public void updatesmsReadCount(ChatRooms chatRooms) {
		chatDao.updatesmsReadCount(chatRooms);		
	}

	@Override
	public void updatewebsocketReadCount(Chatting chatting) {
		chatDao.updatewebsocketReadCount(chatting);		
	}
	
}
