package com.kh.dim2.domain;

import java.sql.Date;

public class Recent_View {
	private String RV_ID;
	private int RV_P_NO;
	private Date RV_DATE;
	private int RV_NO;
	private String RV_IMG;
	
	public String getRV_IMG() {
		return RV_IMG;
	}
	public void setRV_IMG(String rV_IMG) {
		RV_IMG = rV_IMG;
	}
	public String getRV_ID() {
		return RV_ID;
	}
	public void setRV_ID(String rV_ID) {
		RV_ID = rV_ID;
	}
	public int getRV_P_NO() {
		return RV_P_NO;
	}
	public void setRV_P_NO(int rV_P_NO) {
		RV_P_NO = rV_P_NO;
	}
	public Date getRV_DATE() {
		return RV_DATE;
	}
	public void setRV_DATE(Date rV_DATE) {
		RV_DATE = rV_DATE;
	}
	public int getRV_NO() {
		return RV_NO;
	}
	public void setRV_NO(int rV_NO) {
		RV_NO = rV_NO;
	}
}
