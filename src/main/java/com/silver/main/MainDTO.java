package com.silver.main;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("mainCall")
public class MainDTO {
	private String mem_id;
	private String mem_name;
	private String mem_email;
	private String dept_name;
	private String pos_name;
	private String fp_newFileName;
	private int bd_idx;
	private String bd_title;
	private Timestamp bd_date;
	private String bd_content;
	private String re_name;
	private String re_gender;
	private String re_grade;
	private String ro_name;
	private String re_state;
	private String re_jumin;
	
	
	
	
	public String getRe_jumin() {
		return re_jumin;
	}
	public void setRe_jumin(String re_jumin) {
		this.re_jumin = re_jumin;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
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
	public String getRo_name() {
		return ro_name;
	}
	public void setRo_name(String ro_name) {
		this.ro_name = ro_name;
	}
	public String getRe_state() {
		return re_state;
	}
	public void setRe_state(String re_state) {
		this.re_state = re_state;
	}
	
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
	public String getFp_newFileName() {
		return fp_newFileName;
	}
	public void setFp_newFileName(String fp_newFileName) {
		this.fp_newFileName = fp_newFileName;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	
	
	
	
	
}
