package com.kh.dim2.domain;

//join 할 때 사용하는 vo
//soo 만듦

public class Q_Product {

	private int P_NO;
	private String P_NAME;
	private String P_SELLER;
	//private int P_CATEGORY_NO;
	//private int P_PRICE;
	private String P_IMG;
	//private int P_QUANTITY;
	//private String P_DESCRIPTION;
	//private int P_READCOUNT;
	//private int P_DIBS;
	//private String P_REGDATE;
	private int QNA_NO;
	private int QNA_P_NO;
	private String QNA_SUBJECT;
	private String QNA_CONTENT;
	private String QNA_WRITER;
	private String QNA_DATE;
	private int QNA_CATEGORY;
	private String QNA_S_ID;
	private int QNA_SECRET;
	private int QNA_ISRESPONSE;
	private String QNA_ANSWER;
	
	private String SELLER_NAME;
	
	
	
	
	
	public String getSELLER_NAME() {
		return SELLER_NAME;
	}
	public void setSELLER_NAME(String sELLER_NAME) {
		SELLER_NAME = sELLER_NAME;
	}
	public String getQNA_ANSWER() {
		return QNA_ANSWER;
	}
	public void setQNA_ANSWER(String qNA_ANSWER) {
		QNA_ANSWER = qNA_ANSWER;
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
	public String getP_IMG() {
		return P_IMG;
	}
	public void setP_IMG(String p_IMG) {
		P_IMG = p_IMG;
	}
	public int getQNA_NO() {
		return QNA_NO;
	}
	public void setQNA_NO(int qNA_NO) {
		QNA_NO = qNA_NO;
	}
	public int getQNA_P_NO() {
		return QNA_P_NO;
	}
	public void setQNA_P_NO(int qNA_P_NO) {
		QNA_P_NO = qNA_P_NO;
	}
	public String getQNA_SUBJECT() {
		return QNA_SUBJECT;
	}
	public void setQNA_SUBJECT(String qNA_SUBJECT) {
		QNA_SUBJECT = qNA_SUBJECT;
	}
	public String getQNA_CONTENT() {
		return QNA_CONTENT;
	}
	public void setQNA_CONTENT(String qNA_CONTENT) {
		QNA_CONTENT = qNA_CONTENT;
	}
	public String getQNA_WRITER() {
		return QNA_WRITER;
	}
	public void setQNA_WRITER(String qNA_WRITER) {
		QNA_WRITER = qNA_WRITER;
	}
	public String getQNA_DATE() {
		return QNA_DATE;
	}
	public void setQNA_DATE(String qNA_DATE) {
		QNA_DATE = qNA_DATE;
	}
	public int getQNA_CATEGORY() {
		return QNA_CATEGORY;
	}
	public void setQNA_CATEGORY(int qNA_CATEGORY) {
		QNA_CATEGORY = qNA_CATEGORY;
	}
	public String getQNA_S_ID() {
		return QNA_S_ID;
	}
	public void setQNA_S_ID(String qNA_S_ID) {
		QNA_S_ID = qNA_S_ID;
	}
	public int getQNA_SECRET() {
		return QNA_SECRET;
	}
	public void setQNA_SECRET(int qNA_SECRET) {
		QNA_SECRET = qNA_SECRET;
	}
	public int getQNA_ISRESPONSE() {
		return QNA_ISRESPONSE;
	}
	public void setQNA_ISRESPONSE(int qNA_ISRESPONSE) {
		QNA_ISRESPONSE = qNA_ISRESPONSE;
	}
	
	
}
