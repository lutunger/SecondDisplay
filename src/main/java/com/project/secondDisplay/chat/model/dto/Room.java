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
    private Goods goods;
    private int user1No;
    private int user2No;
    private int notReadCount;
}
