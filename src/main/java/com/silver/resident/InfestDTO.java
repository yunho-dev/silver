package com.silver.resident;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("infest")
public class InfestDTO {
	private int if_idx;
	private String if_write;
	private Timestamp if_date;  
	private String if_jusa;
	private String if_comment; 
	private String if_name;
	private String if_state;
	private int re_idx;
	private String re_jumin;
	private String re_name;
	private String ro_name;
	
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRo_name() {
		return ro_name;
	}
	public void setRo_name(String ro_name) {
		this.ro_name = ro_name;
	}
	public String getRe_jumin() {
		return re_jumin;
	}
	public void setRe_jumin(String re_jumin) {
		this.re_jumin = re_jumin;
	}
	public int getIf_idx() {
		return if_idx;
	}
	public void setIf_idx(int if_idx) {
		this.if_idx = if_idx;
	}
	public String getIf_write() {
		return if_write;
	}
	public void setIf_write(String if_write) {
		this.if_write = if_write;
	}
	public Timestamp getIf_date() {
		return if_date;
	}
	public void setIf_date(Timestamp if_date) {
		this.if_date = if_date;
	}
	public String getIf_jusa() {
		return if_jusa;
	}
	public void setIf_jusa(String if_jusa) {
		this.if_jusa = if_jusa;
	}
	public String getIf_comment() {
		return if_comment;
	}
	public void setIf_comment(String if_comment) {
		this.if_comment = if_comment;
	}
	public String getIf_name() {
		return if_name;
	}
	public void setIf_name(String if_name) {
		this.if_name = if_name;
	}
	public String getIf_state() {
		return if_state;
	}
	public void setIf_state(String if_state) {
		this.if_state = if_state;
	}
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	
}
