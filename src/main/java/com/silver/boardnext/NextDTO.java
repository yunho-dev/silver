package com.silver.boardnext;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("next")
public class NextDTO {
	private int bd_idx;
	private String bd_title;
	private String mem_id;
	private Timestamp bd_date;
	private String bd_content;
	private int bc_idx;
	private String bc_name;
	private String mem_name;
	public int getBd_idx() {
		return bd_idx;
	}
	public void setBd_idx(int bd_idx) {
		this.bd_idx = bd_idx;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Timestamp getBd_date() {
		return bd_date;
	}
	public void setBd_date(Timestamp bd_date) {
		this.bd_date = bd_date;
	}
	public String getBd_content() {
		return bd_content;
	}
	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}
	public int getBc_idx() {
		return bc_idx;
	}
	public void setBc_idx(int bc_idx) {
		this.bc_idx = bc_idx;
	}
	public String getBc_name() {
		return bc_name;
	}
	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	

}
