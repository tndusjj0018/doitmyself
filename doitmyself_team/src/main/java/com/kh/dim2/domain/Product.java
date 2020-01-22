package com.kh.dim2.domain;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int P_NO; //상품 번호
	private String P_NAME; //상품 이름
	private String P_SELLER; //가게 이름
	private int P_CATEGORY_NO; //카테고리 넘버
	private int P_PRICE; //가격
	private String P_IMG; //메인 사진 이름
	private MultipartFile uploadfile;
	private int P_QUANTITY; //재고수량
	private String P_DESCRIPTION; //상품 설명
	private int P_READCOUNT; // 상품 조회수
	private int P_DIBS; //상품 찜 수
	private String P_REGDATE; //상품 추가 날짜
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getP_NO() {
		return P_NO;
	}
	public void setP_NO(int p_NO) {
		P_NO = p_NO;
	}
	public String getP_NAME() {
		return P_NAME;
	}
	public void setP_NAME(String p_NAME) {
		P_NAME = p_NAME;
	}
	public String getP_SELLER() {
		return P_SELLER;
	}
	public void setP_SELLER(String p_SELLER) {
		P_SELLER = p_SELLER;
	}
	public int getP_CATEGORY_NO() {
		return P_CATEGORY_NO;
	}
	public void setP_CATEGORY_NO(int p_CATEGORY_NO) {
		P_CATEGORY_NO = p_CATEGORY_NO;
	}
	public int getP_PRICE() {
		return P_PRICE;
	}
	public void setP_PRICE(int p_PRICE) {
		P_PRICE = p_PRICE;
	}
	public String getP_IMG() {
		return P_IMG;
	}
	public void setP_IMG(String p_IMG) {
		P_IMG = p_IMG;
	}
	public int getP_QUANTITY() {
		return P_QUANTITY;
	}
	public void setP_QUANTITY(int p_QUANTITY) {
		P_QUANTITY = p_QUANTITY;
	}
	public String getP_DESCRIPTION() {
		return P_DESCRIPTION;
	}
	public void setP_DESCRIPTION(String p_DESCRIPTION) {
		P_DESCRIPTION = p_DESCRIPTION;
	}
	public int getP_READCOUNT() {
		return P_READCOUNT;
	}
	public void setP_READCOUNT(int p_READCOUNT) {
		P_READCOUNT = p_READCOUNT;
	}
	public int getP_DIBS() {
		return P_DIBS;
	}
	public void setP_DIBS(int p_DIBS) {
		P_DIBS = p_DIBS;
	}
	public String getP_REGDATE() {
		return P_REGDATE;
	}
	public void setP_REGDATE(String p_REGDATE) {
		P_REGDATE = p_REGDATE;
	}
	
	
	
	
	
}
