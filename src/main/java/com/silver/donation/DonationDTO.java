package com.silver.donation;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("donation")
public class DonationDTO {
	private int do_idx;
	private String do_name;
	private Date do_date;
	private String do_goal;
	private String do_write;
	private int do_money;
	
	public int getDo_idx() {
		return do_idx;
	}
	public void setDo_idx(int do_idx) {
		this.do_idx = do_idx;
	}
	public String getDo_name() {
		return do_name;
	}
	public void setDo_name(String do_name) {
		this.do_name = do_name;
	}
	public Date getDo_date() {
		return do_date;
	}
	public void setDo_date(Date do_date) {
		this.do_date = do_date;
	}
	public String getDo_goal() {
		return do_goal;
	}
	public void setDo_goal(String do_goal) {
		this.do_goal = do_goal;
	}
	public String getDo_write() {
		return do_write;
	}
	public void setDo_write(String do_write) {
		this.do_write = do_write;
	}
	public int getDo_money() {
		return do_money;
	}
	public void setDo_money(int do_money) {
		this.do_money = do_money;
	}
}
