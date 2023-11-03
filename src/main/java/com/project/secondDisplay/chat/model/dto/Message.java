package com.project.secondDisplay.chat.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
    private int messageNo;
    private int chatRoomNo;
    private int senderUserNo;
    private int receiverUserNo;
    private String message;
    private String messageSentDT;
    private String readMessage;
}
