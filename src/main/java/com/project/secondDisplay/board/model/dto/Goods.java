package com.project.secondDisplay.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Goods {
	private int goodsNo;
	private int userNo;
	private int categoryNo;
	private String goodsTitle;
	private String goodsDescr;
	private int goodsPrice;
	private int viewCount;
	private String enrollDate;
	private String goodsStatus;
	private String goodsStatusName;
//	
//	public Goods(int goodsNo, int userNo, int categoryNo, String goodsTitle, String goodsDescr, int goodsPrice,
//			int viewCount, String enrollDate, String goodsStatus) {
//		super();
//		this.goodsNo = goodsNo;
//		this.userNo = userNo;
//		this.categoryNo = categoryNo;
//		this.goodsTitle = goodsTitle;
//		this.goodsDescr = goodsDescr;
//		this.goodsPrice = goodsPrice;
//		this.viewCount = viewCount;
//		this.enrollDate = enrollDate;
//		this.goodsStatus = goodsStatus;
//		
////		if(goodsStatus.equals("A")) this.goodsStatusName = "판매중";
////		if(goodsStatus.equals("B"))	this.goodsStatusName = "비공개";
////		if(goodsStatus.equals("S"))	this.goodsStatusName = "임시저장";
////		if(goodsStatus.equals("E"))	this.goodsStatusName = "판매완료";
////		if(goodsStatus.equals("P"))	this.goodsStatusName = "예약중";
//	}
	
	
}
