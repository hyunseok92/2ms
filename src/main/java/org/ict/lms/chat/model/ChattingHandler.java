package org.ict.lms.chat.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

public class ChattingHandler extends BinaryWebSocketHandler{
	private List<WebSocketSession> client=new ArrayList();
	private String fileName;
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("웹소켓 핸들러 : 연결됨");
    	client.add(session);
        // 클라이언트와 연결이 성공한 후 호출
    }

	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) {
        // 클라이언트로부터 메시지를 받았을 때 호출
        // 받은 메시지를 처리하고, 필요한 경우 다른 클라이언트에게 메시지를 전달
	    String receivedMessage = message.getPayload();
	    // 메시지를 다시 보내기
	    for (WebSocketSession clientSession : client) {
	        if (!clientSession.equals(session)) {
	            try {
	                // 현재 클라이언트 세션과 같은 세션을 제외하고 모든 클라이언트에게 메시지를 전송
	                clientSession.sendMessage(message);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 클라이언트와 연결이 종료될 때 호출
    	client.remove(session);
    }
}
