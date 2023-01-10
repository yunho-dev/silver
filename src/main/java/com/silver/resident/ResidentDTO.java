package com.silver.resident;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("rd")
public class ResidentDTO {

	private int re_idx;
	private String re_name;
	private String re_state;
	private String re_gender;
	private String re_grade;
	private String re_pnum;
	private String re_addr;
	private String re_sick;
	private String re_text;
	private String re_jumin;
	private LocalDateTime  re_date;
	private String ro_name;
	private String re_daddr;
	
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_state() {
		return re_state;
	}
	public void setRe_state(String re_state) {
		this.re_state = re_state;
	}
	public String getRe_gender() {
		return re_gender;
	}
	public void setRe_gender(String re_gender) {
		this.re_gender = re_gender;
	}
	public String getRe_grade() {
		return re_grade;
	}
	public void setRe_grade(String re_grade) {
		this.re_grade = re_grade;
	}
	public String getRe_pnum() {
		return re_pnum;
	}
	public void setRe_pnum(String re_pnum) {
		this.re_pnum = re_pnum;
	}
	public String getRe_addr() {
		return re_addr;
	}
	public void setRe_addr(String re_addr) {
		this.re_addr = re_addr;
	}
	public String getRe_sick() {
		return re_sick;
	}
	public void setRe_sick(String re_sick) {
		this.re_sick = re_sick;
	}
	public String getRe_text() {
		return re_text;
	}
	public void setRe_text(String re_text) {
		this.re_text = re_text;
	}
	public String getRe_jumin() {
		return re_jumin;
	}
	public void setRe_jumin(String re_jumin) {
		this.re_jumin = re_jumin;
	}
	public LocalDateTime getRe_date() {
		return re_date;
	}
	public void setRe_date(LocalDateTime re_date) {
		this.re_date = re_date;
	}
	public String getRo_name() {
		return ro_name;
	}
	public void setRo_name(String ro_name) {
		this.ro_name = ro_name;
	}
	public String getRe_daddr() {
		return re_daddr;
	}
	public void setRe_daddr(String re_daddr) {
		this.re_daddr = re_daddr;
	}
	
	
	
}
