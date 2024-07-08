package com.everytime.web.exception;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {

    // 사용자 세션 저장소 (세션 ID -> WebSocketSession)
    private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

    // 사용자와 채팅방 ID 매핑 저장소 (세션 ID -> 채팅방 ID)
    private Map<String, String> userChatRoomMap = new ConcurrentHashMap<>();

    /*
     * 클라이언트가 접속하면, 클라이언트가 전달한 WebSocketSession을 users 맵에 추가하고
     * 클라이언트의 채팅방 ID를 userChatRoomMap에 저장한다.
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println(session.getId() + " 연결됨");
        users.put(session.getId(), session);

        // 세션 URI로부터 채팅방 ID 추출 (예: ws://localhost:8080/web/chat/message-ws/{chatRoomId})
        String chatRoomId = getChatRoomIdFromSession(session);
        userChatRoomMap.put(session.getId(), chatRoomId);
    }

    /*
     * 클라이언트가 보낸 메시지는 동일한 채팅방에 있는 WebSocketSession들에게만 전달된다.
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 현재 세션의 채팅방 ID 가져오기
        String chatRoomId = userChatRoomMap.get(session.getId());

        // 동일한 채팅방에 있는 세션들에게만 메시지 전달
        for (Map.Entry<String, WebSocketSession> entry : users.entrySet()) {
            String sessionId = entry.getKey();
            WebSocketSession s = entry.getValue();
            if (chatRoomId.equals(userChatRoomMap.get(sessionId))) {
                s.sendMessage(message);
            }
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println(session.getId() + " 전송 에러 발생 : " + exception.getMessage());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println(session.getId() + " 연결 종료됨");
        users.remove(session.getId());
        userChatRoomMap.remove(session.getId());
    }

    // WebSocketSession으로부터 채팅방 ID 추출 메소드
    private String getChatRoomIdFromSession(WebSocketSession session) {
        String uri = session.getUri().toString();
        return uri.substring(uri.lastIndexOf('/') + 1);
    }
}