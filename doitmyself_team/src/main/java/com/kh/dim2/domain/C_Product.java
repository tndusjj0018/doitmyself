package com.kh.dim2.domain;

import org.springframework.web.multipart.MultipartFile;

public class C_Product {
	private int CART_NO;
	private String CART_ID;
	private int CART_P_NO;
	private int CART_COUNT;
	
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
	
	private int ORDER_NO;
	private int ORDER_P_NO;
	private int ORDER_DELIVERY;
	private int ORDER_STATUS;
	private String ORDER_ID;
	private int ORDER_CATEGORY;
	private int ORDER_PRICE;
	private String ORDER_PAYMENT;
	private String ORDER_ADDRESS;
	private String ORDER_DATE;
	private String ORDER_R_DATE;
	private String ORDER_SELLER; 
	private String ORDER_TRNO;
	private int ORDER_AMOUNT;
	public int getCART_NO() {
		return CART_NO;
	}
	public void setCART_NO(int cART_NO) {
		CART_NO = cART_NO;
	}
	public String getCART_ID() {
		return CART_ID;
	}
	public void setCART_ID(String cART_ID) {
		CART_ID = cART_ID;
	}
	public int getCART_P_NO() {
		return CART_P_NO;
	}
	public void setCART_P_NO(int cART_P_NO) {
		CART_P_NO = cART_P_NO;
	}
	public int getCART_COUNT() {
		return CART_COUNT;
	}
	public void setCART_COUNT(int cART_COUNT) {
		CART_COUNT = cART_COUNT;
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
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
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
	public int getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public int getORDER_P_NO() {
		return ORDER_P_NO;
	}
	public void setORDER_P_NO(int oRDER_P_NO) {
		ORDER_P_NO = oRDER_P_NO;
	}
	public int getORDER_DELIVERY() {
		return ORDER_DELIVERY;
	}
	public void setORDER_DELIVERY(int oRDER_DELIVERY) {
		ORDER_DELIVERY = oRDER_DELIVERY;
	}
	public int getORDER_STATUS() {
		return ORDER_STATUS;
	}
	public void setORDER_STATUS(int oRDER_STATUS) {
		ORDER_STATUS = oRDER_STATUS;
	}
	public String getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}
	public int getORDER_CATEGORY() {
		return ORDER_CATEGORY;
	}
	public void setORDER_CATEGORY(int oRDER_CATEGORY) {
		ORDER_CATEGORY = oRDER_CATEGORY;
	}
	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
	public String getORDER_PAYMENT() {
		return ORDER_PAYMENT;
	}
	public void setORDER_PAYMENT(String oRDER_PAYMENT) {
		ORDER_PAYMENT = oRDER_PAYMENT;
	}
	public String getORDER_ADDRESS() {
		return ORDER_ADDRESS;
	}
	public void setORDER_ADDRESS(String oRDER_ADDRESS) {
		ORDER_ADDRESS = oRDER_ADDRESS;
	}
	public String getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(String oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public String getORDER_R_DATE() {
		return ORDER_R_DATE;
	}
	public void setORDER_R_DATE(String oRDER_R_DATE) {
		ORDER_R_DATE = oRDER_R_DATE;
	}
	public String getORDER_SELLER() {
		return ORDER_SELLER;
	}
	public void setORDER_SELLER(String oRDER_SELLER) {
		ORDER_SELLER = oRDER_SELLER;
	}
	public String getORDER_TRNO() {
		return ORDER_TRNO;
	}
	public void setORDER_TRNO(String oRDER_TRNO) {
		ORDER_TRNO = oRDER_TRNO;
	}
	public int getORDER_AMOUNT() {
		return ORDER_AMOUNT;
	}
	public void setORDER_AMOUNT(int oRDER_AMOUNT) {
		ORDER_AMOUNT = oRDER_AMOUNT;
	}
	
	
	
}
