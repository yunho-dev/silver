package com.silver.alarm;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("alarm")
public class AlarmDTO {
	
	private int ar_idx;
	private String mem_id;
	private String ar_cnt;
	private String ar_send;
	private Timestamp ar_date;
	private String ar_content;
	private int ac_idx;
	private String ac_cate;
	private String ar_addr;
	
	public String getAr_addr() {
		return ar_addr;
	}
	public void setAr_addr(String ar_addr) {
		this.ar_addr = ar_addr;
	}
	public int getAr_idx() {
		return ar_idx;
	}
	public void setAr_idx(int ar_idx) {
		this.ar_idx = ar_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAr_cnt() {
		return ar_cnt;
	}
	public void setAr_cnt(String ar_cnt) {
		this.ar_cnt = ar_cnt;
	}
	public String getAr_send() {
		return ar_send;
	}
	public void setAr_send(String ar_send) {
		this.ar_send = ar_send;
	}
	public Timestamp getAr_date() {
		return ar_date;
	}
	public void setAr_date(Timestamp ar_date) {
		this.ar_date = ar_date;
	}
	public String getAr_content() {
		return ar_content;
	}
	public void setAr_content(String ar_content) {
		this.ar_content = ar_content;
	}
	public int getAc_idx() {
		return ac_idx;
	}
	public void setAc_idx(int ac_idx) {
		this.ac_idx = ac_idx;
	}
	public String getAc_cate() {
		return ac_cate;
	}
	public void setAc_cate(String ac_cate) {
		this.ac_cate = ac_cate;
	}
	
	
	 

}
