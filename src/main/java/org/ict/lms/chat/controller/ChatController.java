package org.ict.lms.chat.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.ict.lms.chat.model.service.ChatService;
import org.ict.lms.chat.model.vo.ChatList;
import org.ict.lms.chat.model.vo.ChatRooms;
import org.ict.lms.chat.model.vo.Chatting;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	//채팅방 목록 페이지로 이동
	@RequestMapping("chatroomList.do") 
		public String ChatroomList(@RequestParam("prof_code") String prof_code, Model model) {
		ArrayList<ChatList> list = chatService.selectChatroomList(prof_code);
		
		model.addAttribute("list", list);
		return "chat/chat"; 
	}

	@RequestMapping(value="callChatroomList.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String Chat(HttpServletResponse response, @RequestParam(name = "prof_code", required = false) String prof_code) throws IOException {
		ArrayList<ChatList> list = chatService.selectChatroomList(prof_code);
		response.setContentType("application/json; charset=utf-8");
		// 리턴된 list 결과를 json 배열에 담아서 내보내는 처리 :
		// 전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();
		// list를 담을 json 배열 객체 생성
		JSONArray jarr = new JSONArray();

		// list 를 json 배열에 옮기기
		for (ChatList cl : list) {
			// 값을 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("chat_room", cl.getChat_room());
			job.put("chat_talker", cl.getChat_talker());
			job.put("chat_content", URLEncoder.encode(cl.getChat_content(), "utf-8"));
			job.put("chat_time", cl.getChat_time());
			job.put("chat_readcount", cl.getChat_readcount());
			job.put("chat_date", cl.getChat_date().toString());
			job.put("chat_talker_name", URLEncoder.encode(cl.getChat_talker_name(), "utf-8"));
			job.put("student_name", URLEncoder.encode(cl.getStudent_name(), "utf-8"));
			job.put("student_code", cl.getStudent_code());
			jarr.add(job);
		}
		// 전송용 객체에 jarr 저장
		sendJson.put("alist", jarr);
		return sendJson.toJSONString();
	}

	//채팅방 페이지로 이동
	@RequestMapping("chatroom.do")
	public String ChatRooms(@RequestParam(value = "student_code", required=false) String student_code, 
			@RequestParam(value = "prof_code", required=false) String prof_code, 
			@RequestParam(value = "chat_room", required=false) String chat_room, 
			Model model) {	
		ChatRooms crs = new ChatRooms();
		if (student_code != null && prof_code == null) {
			crs = chatService.selectchatroom(student_code);
			if(crs == null) {
				chatService.insertchatroom(student_code);
				crs = chatService.selectchatroom(student_code);
			}else {
				chatService.updatetmsReadCount(crs);		
			}
			model.addAttribute("ChatRoom", crs);
		}
		
		if (prof_code != null) {
			crs.setChat_room(chat_room);
			crs.setProf_code(prof_code);
			crs.setStudent_code(student_code);			
			ChatRooms tcrs = chatService.selectchatroom(crs);
			if(tcrs == null) {
				chatService.insertchatroom(crs);
				tcrs = chatService.selectchatroom(crs);
			} else {
				chatService.updatesmsReadCount(tcrs);				
			}
			model.addAttribute("ChatRoom", tcrs);
		}
		ArrayList<ChatList> list = chatService.selectChattingList(student_code);
		
		model.addAttribute("chatList", list);
		
		return "chat/chatroom"; // 내보낼 뷰파일명
	}
	
	@RequestMapping(value="sendchat.do", method= RequestMethod.POST)
	public ResponseEntity<String> SendChat(@RequestBody String param) throws ParseException {

	      JSONParser jparser = new JSONParser();
	      JSONObject job = (JSONObject)jparser.parse(param);
		
	      Chatting chatting = new Chatting();
	      chatting.setChat_room((String)job.get("chat_room"));
	      chatting.setChat_talker((String)job.get("chat_talker"));
	      chatting.setChat_content((String)job.get("chat_content"));
	      chatting.setChat_talker_name((String)job.get("chat_talker_name"));
	      
	      int result = chatService.insertchat(chatting);
	      
	      //뷰리졸버가 아닌 출력스트림으로 나감
	      if(result > 0) {
	         return new ResponseEntity<String>("success", HttpStatus.OK);
	      }else {
	         return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
	      }
	}
	
	@RequestMapping(value = "readcountDown.do", method = RequestMethod.POST)	
	public ResponseEntity<String> WebSocketReadCount(@RequestBody String param) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject) jparser.parse(param);
		Chatting chatting = new Chatting();
		chatting.setChat_room((String) job.get("chat_room"));
		chatting.setChat_talker((String) job.get("chat_talker"));
		chatting.setChat_talker_name((String) job.get("chat_talker_name"));
		chatService.updatewebsocketReadCount(chatting);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value = "readcheck.do", method = RequestMethod.POST)	
	@ResponseBody
	public String WebSocketChattingList(HttpServletResponse response, @RequestParam(name = "student_code", required = false) String student_code) throws IOException {
		ArrayList<ChatList> list = chatService.selectChattingList(student_code);
		response.setContentType("application/json; charset=utf-8");
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (ChatList cl : list) {
			JSONObject job = new JSONObject();

			job.put("chat_room", cl.getChat_room());
			job.put("chat_talker", cl.getChat_talker());
			job.put("chat_content", URLEncoder.encode(cl.getChat_content(), "utf-8"));
			job.put("chat_time", cl.getChat_time());
			job.put("chat_readcount", cl.getChat_readcount());
			job.put("chat_date", cl.getChat_date().toString());
			job.put("chat_talker_name", URLEncoder.encode(cl.getChat_talker_name(), "utf-8"));
			job.put("student_name", URLEncoder.encode(cl.getStudent_name(), "utf-8"));
			job.put("prof_code", cl.getProf_code());
			job.put("student_code", cl.getStudent_code());
			
			jarr.add(job);
		}
		sendJson.put("chatlist", jarr);
		return sendJson.toJSONString();
	}
	
}