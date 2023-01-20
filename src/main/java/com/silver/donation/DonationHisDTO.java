package com.silver.donation;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("donhistory")
public class DonationHisDTO {
	private int dh_idx;
	private Date dh_date;
	private String dh_write;
	private String dh_cate;
	private int dh_money;
	private String dh_goal;
	//photo
	private int fp_idx;
	private String fp_oriFileName;
	private String fp_newFileName;
	private Date fp_date;
	private int fpc_idx;
	
	public int getDh_money() {
		return dh_money;
	}
	public void setDh_money(int dh_money) {
		this.dh_money = dh_money;
	}
	public int getFpc_idx() {
		return fpc_idx;
	}
	public void setFpc_idx(int fpc_idx) {
		this.fpc_idx = fpc_idx;
	}
	public Date getFp_date() {
		return fp_date;
	}
	public void setFp_date(Date fp_date) {
		this.fp_date = fp_date;
	}
	public int getFp_idx() {
		return fp_idx;
	}
	public void setFp_idx(int fp_idx) {
		this.fp_idx = fp_idx;
	}
	public String getFp_oriFileName() {
		return fp_oriFileName;
	}
	public void setFp_oriFileName(String fp_oriFileName) {
		this.fp_oriFileName = fp_oriFileName;
	}
	public String getFp_newFileName() {
		return fp_newFileName;
	}
	public void setFp_newFileName(String fp_newFileName) {
		this.fp_newFileName = fp_newFileName;
	}
	public int getDh_idx() {
		return dh_idx;
	}
	public void setDh_idx(int dh_idx) {
		this.dh_idx = dh_idx;
	}
	public Date getDh_date() {
		return dh_date;
	}
	public void setDh_date(Date dh_date) {
		this.dh_date = dh_date;
	}
	public String getDh_write() {
		return dh_write;
	}
	public void setDh_write(String dh_write) {
		this.dh_write = dh_write;
	}
	public String getDh_cate() {
		return dh_cate;
	}
	public void setDh_cate(String dh_cate) {
		this.dh_cate = dh_cate;
	}
	
	public String getDh_goal() {
		return dh_goal;
	}
	public void setDh_goal(String dh_goal) {
		this.dh_goal = dh_goal;
	}
	public void setDh_money(String string) {
		
		
	}
	
	
	
}
