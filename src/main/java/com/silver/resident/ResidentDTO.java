package com.silver.resident;


import java.sql.Timestamp;

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
	private Timestamp re_date;
	private String ro_name;
	private String re_daddr;
	private int  fp_idx;
	private int  fpc_idx;
	private String  fp_oriFileName;
	private String  fp_newFileName;
	private Timestamp  fp_date;
	private String re_age;
	private String  file_fp_oriFileName;
	private String  file_fp_newFileName;	
	private int  cu_num;
	private String  cu_content;
	private int  cc_idx;
	private String  co_write;
	private Timestamp  co_start;
	private Timestamp  co_end;
	private String  co_event;
	
	
	
	
	
	
	
	public int getCu_num() {
		return cu_num;
	}
	public void setCu_num(int cu_num) {
		this.cu_num = cu_num;
	}
	public String getCu_content() {
		return cu_content;
	}
	public void setCu_content(String cu_content) {
		this.cu_content = cu_content;
	}
	public int getCc_idx() {
		return cc_idx;
	}
	public void setCc_idx(int cc_idx) {
		this.cc_idx = cc_idx;
	}
	public String getCo_write() {
		return co_write;
	}
	public void setCo_write(String co_write) {
		this.co_write = co_write;
	}
	public Timestamp getCo_start() {
		return co_start;
	}
	public void setCo_start(Timestamp co_start) {
		this.co_start = co_start;
	}
	public Timestamp getCo_end() {
		return co_end;
	}
	public void setCo_end(Timestamp co_end) {
		this.co_end = co_end;
	}
	public String getCo_event() {
		return co_event;
	}
	public void setCo_event(String co_event) {
		this.co_event = co_event;
	}
	public String getFile_fp_oriFileName() {
		return file_fp_oriFileName;
	}
	public void setFile_fp_oriFileName(String file_fp_oriFileName) {
		this.file_fp_oriFileName = file_fp_oriFileName;
	}
	public String getFile_fp_newFileName() {
		return file_fp_newFileName;
	}
	public void setFile_fp_newFileName(String file_fp_newFileName) {
		this.file_fp_newFileName = file_fp_newFileName;
	}
	public String getRe_age() {
		return re_age;
	}
	public void setRe_age(String re_age) {
		this.re_age = re_age;
	}
	public int getFp_idx() {
		return fp_idx;
	}
	public void setFp_idx(int fp_idx) {
		this.fp_idx = fp_idx;
	}
	public int getFpc_idx() {
		return fpc_idx;
	}
	public void setFpc_idx(int fpc_idx) {
		this.fpc_idx = fpc_idx;
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
	public Timestamp getFp_date() {
		return fp_date;
	}
	public void setFp_date(Timestamp fp_date) {
		this.fp_date = fp_date;
	}
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
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
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
