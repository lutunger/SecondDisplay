package com.project.secondDisplay.chat.model.dto;

import com.project.secondDisplay.board.model.dto.Goods;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Room {
    private int chatRoomNo;
    private int goodsNo;
    private String goodsTitle;
    private int goodsPrice;
    private String thumbNail;
    private int user1No;
    private String user1Nickname;
    private int user2No;
    private String user2Nickname;
    private int notReadCount;
}
