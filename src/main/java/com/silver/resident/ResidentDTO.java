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
	private String  cc_name;	
	private String bgcolor;

	
	public String getBgcolor() {
		return bgcolor;
	}
	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}
	
	public String getCc_name() {
		return cc_name;
	}
	public void setCc_name(String cc_name) {
		this.cc_name = cc_name;
	}
	//cure
	private int  cu_num;
	private String  cu_content;
	private int  cc_idx;
	private String  co_write;
	private String co_start;
	private String co_end;	
	private String  co_event;
	
	public String getCo_start() {
		return co_start;
	}
	public void setCo_start(String co_start) {
		this.co_start = co_start;
	}
	public String getCo_end() {
		return co_end;
	}
	public void setCo_end(String co_end) {
		this.co_end = co_end;
	}
	
	//medic
	private int  me_num;
	private String me_name;
	private String me_volume;
	private String me_way;
	private String me_write;
	private Timestamp me_start;
	private Timestamp me_end;
	private String me_event;
	//vital
	private int vi_num;
	private int vi_blood;
	private int vi_heart;
	private double vi_temp;
	private int vi_breath;
	private int vi_sugar;
	private double vi_weight;
	private String vi_write;
	private Timestamp vi_start;
	private Timestamp vi_end;
	private String vi_event;

	
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public void setVi_blood(int vi_blood) {
		this.vi_blood = vi_blood;
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
	public String getRe_age() {
		return re_age;
	}
	public void setRe_age(String re_age) {
		this.re_age = re_age;
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
	/*
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
	*/
	public String getCo_event() {
		return co_event;
	}
	public void setCo_event(String co_event) {
		this.co_event = co_event;
	}
	public int getMe_num() {
		return me_num;
	}
	public void setMe_num(int me_num) {
		this.me_num = me_num;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public String getMe_volume() {
		return me_volume;
	}
	public void setMe_volume(String me_volume) {
		this.me_volume = me_volume;
	}
	public String getMe_way() {
		return me_way;
	}
	public void setMe_way(String me_way) {
		this.me_way = me_way;
	}
	public String getMe_write() {
		return me_write;
	}
	public void setMe_write(String me_write) {
		this.me_write = me_write;
	}
	public Timestamp getMe_start() {
		return me_start;
	}
	public void setMe_start(Timestamp me_start) {
		this.me_start = me_start;
	}
	public Timestamp getMe_end() {
		return me_end;
	}
	public void setMe_end(Timestamp me_end) {
		this.me_end = me_end;
	}
	public String getMe_event() {
		return me_event;
	}
	public void setMe_event(String me_event) {
		this.me_event = me_event;
	}
	public int getVi_num() {
		return vi_num;
	}
	public void setVi_num(int vi_num) {
		this.vi_num = vi_num;
	}
	public int getVi_blood() {
		return vi_blood;
	}
	public void cu_num(int vi_blood) {
		this.vi_blood = vi_blood;
	}
	public int getVi_heart() {
		return vi_heart;
	}
	public void setVi_heart(int vi_heart) {
		this.vi_heart = vi_heart;
	}
	public double getVi_temp() {
		return vi_temp;
	}
	public void setVi_temp(double vi_temp) {
		this.vi_temp = vi_temp;
	}
	public int getVi_breath() {
		return vi_breath;
	}
	public void setVi_breath(int vi_breath) {
		this.vi_breath = vi_breath;
	}
	public int getVi_sugar() {
		return vi_sugar;
	}
	public void setVi_sugar(int vi_sugar) {
		this.vi_sugar = vi_sugar;
	}
	public double getVi_weight() {
		return vi_weight;
	}
	public void setVi_weight(double vi_weight) {
		this.vi_weight = vi_weight;
	}
	public String getVi_write() {
		return vi_write;
	}
	public void setVi_write(String vi_write) {
		this.vi_write = vi_write;
	}
	public Timestamp getVi_start() {
		return vi_start;
	}
	public void setVi_start(Timestamp vi_start) {
		this.vi_start = vi_start;
	}
	public Timestamp getVi_end() {
		return vi_end;
	}
	public void setVi_end(Timestamp vi_end) {
		this.vi_end = vi_end;
	}
	public String getVi_event() {
		return vi_event;
	}
	public void setVi_event(String vi_event) {
		this.vi_event = vi_event;
	}

	
	
	
}
