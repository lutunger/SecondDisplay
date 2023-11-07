package com.project.secondDisplay.chat.model.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.project.secondDisplay.chat.model.dto.Message;
import com.project.secondDisplay.chat.model.service.ChatService;
import com.project.secondDisplay.user.model.dto.User;


public class ChatWebsocketHandler extends TextWebSocketHandler{
    
    private Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
    
    
    @Autowired
    private ChatService service;
   
    private Set<WebSocketSession> sessions  = Collections.synchronizedSet(new HashSet<WebSocketSession>());
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
    }
    
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        
        Message msg = objectMapper.readValue( message.getPayload(), Message.class);
        
        // DB 삽입 서비스 호출
        int result = service.insertMessage(msg);
        
        if(result > 0 ) {
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
            msg.setMessageSentDT(sdf.format(new Date()) );
            
            for(WebSocketSession s : sessions) {
                
                int loginUserNo = ((User)s.getAttributes().get("loginUser")).getUserNo();
                
                if(loginUserNo == msg.getReceiverUserNo() || loginUserNo == msg.getSenderUserNo()) {
                    
                    s.sendMessage(new TextMessage(new Gson().toJson(msg)));
                }
            }
        }
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
    
}
