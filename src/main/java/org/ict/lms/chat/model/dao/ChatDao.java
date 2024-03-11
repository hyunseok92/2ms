package org.ict.lms.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.chat.model.vo.ChatList;
import org.ict.lms.chat.model.vo.ChatRooms;
import org.ict.lms.chat.model.vo.Chatting;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertchat(Chatting chatting) {
		return sqlSessionTemplate.insert("chatMapper.insertchat", chatting);
	}

	public ChatRooms selectchatroom(String student_code) {
		return sqlSessionTemplate.selectOne("chatMapper.selectstudentchatroom", student_code);
	}

	public ChatRooms selectchatroom(ChatRooms chatRooms) {
		return sqlSessionTemplate.selectOne("chatMapper.selectteacherchatroom", chatRooms);
	}
	
	public ArrayList<ChatList> selectChatroomList(String prof_code) {	
		List<ChatList> list = sqlSessionTemplate.selectList("chatMapper.selectChatroomList", prof_code);
		return (ArrayList<ChatList>)list;
	}
	
	public ArrayList<ChatList> selectChattingList(String student_code) {
		List<ChatList> list = sqlSessionTemplate.selectList("chatMapper.selectChattingList", student_code);
		return (ArrayList<ChatList>)list;
	}

	public void insertchatroom(String student_code) {
		sqlSessionTemplate.insert("chatMapper.insertchatroomSTD", student_code);
	}

	public void insertchatroom(ChatRooms chatRooms) {
		sqlSessionTemplate.insert("chatMapper.insertchatroomTCH", chatRooms);
	}

	public void updatetmsReadCount(ChatRooms chatRooms) {
		sqlSessionTemplate.update("chatMapper.updatetmsReadCount",chatRooms);
	}
	
	public void updatesmsReadCount(ChatRooms chatRooms) {
		sqlSessionTemplate.update("chatMapper.updatesmsReadCount",chatRooms);
	}

	public void updatewebsocketReadCount(Chatting chatting) {
		sqlSessionTemplate.update("chatMapper.updatewebsocketReadCount",chatting);
	}
	
}
