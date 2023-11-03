package com.project.secondDisplay.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class GoodsImg {
	private int fileNo;
	private int goodsNo;
	private String fileName;
	private int fileOrder;
	private String filePath;
}
