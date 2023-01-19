package com.silver.resident;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("program")
public class ResidentProgramDTO {
	
	private int pr_idx;
	private String pr_name;
	private String pr_teacher;
	//pr_star,pr_end timestamp-> String으로 변경해주었다
	private String pr_start;
	private String pr_end;
	private String pr_content;
	private String pr_goal;
	private String pr_place;
	private String pr_state;
	private Date pr_date;
	
	private int pc_idx;
	private String pc_cate;
	
	
	public int getPr_idx() {
		return pr_idx;
	}
	public void setPr_idx(int pr_idx) {
		this.pr_idx = pr_idx;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}
	public String getPr_teacher() {
		return pr_teacher;
	}
	public void setPr_teacher(String pr_teacher) {
		this.pr_teacher = pr_teacher;
	}
	
	
	public String getPr_start() {
		return pr_start;
	}
	public void setPr_start(String pr_start) {
		this.pr_start = pr_start;
	}
	public String getPr_end() {
		return pr_end;
	}
	public void setPr_end(String pr_end) {
		this.pr_end = pr_end;
	}
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public String getPr_goal() {
		return pr_goal;
	}
	public void setPr_goal(String pr_goal) {
		this.pr_goal = pr_goal;
	}
	public String getPr_place() {
		return pr_place;
	}
	public void setPr_place(String pr_place) {
		this.pr_place = pr_place;
	}
	public String getPr_state() {
		return pr_state;
	}
	public void setPr_state(String pr_state) {
		this.pr_state = pr_state;
	}

	public Date getPr_date() {
		return pr_date;
	}
	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	
	public int getPc_idx() {
		return pc_idx;
	}
	public void setPc_idx(int pc_idx) {
		this.pc_idx = pc_idx;
	}
	public String getPc_cate() {
		return pc_cate;
	}
	public void setPc_cate(String pc_cate) {
		this.pc_cate = pc_cate;
	}
	
	

}
