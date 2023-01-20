package com.silver.payment;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("phPayment")
public class PaymentHistoryDTO {
	private int ph_idx;
	private String ph_name;
	private String ph_ip;
	private String ph_state;
	private String ph_line;
	private Timestamp ph_date;
	private int pm_idx;
	private String mem_id;
	private String pm_dept;
	private Timestamp pm_date;
	private String mem_name;
	private String mem_state;
	private String dept_name;
	private String pos_name;
	private String ho_type;
	private int dept_code;
	private int pos_level;
	private int dept_num;
	private int rowNum;
	
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPm_dept() {
		return pm_dept;
	}
	public void setPm_dept(String pm_dept) {
		this.pm_dept = pm_dept;
	}
	public Timestamp getPm_date() {
		return pm_date;
	}
	public void setPm_date(Timestamp pm_date) {
		this.pm_date = pm_date;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_state() {
		return mem_state;
	}
	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
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
	public String getHo_type() {
		return ho_type;
	}
	public void setHo_type(String ho_type) {
		this.ho_type = ho_type;
	}
	public int getDept_code() {
		return dept_code;
	}
	public void setDept_code(int dept_code) {
		this.dept_code = dept_code;
	}
	public int getPos_level() {
		return pos_level;
	}
	public void setPos_level(int pos_level) {
		this.pos_level = pos_level;
	}
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public int getPh_idx() {
		return ph_idx;
	}
	public void setPh_idx(int ph_idx) {
		this.ph_idx = ph_idx;
	}
	public String getPh_name() {
		return ph_name;
	}
	public void setPh_name(String ph_name) {
		this.ph_name = ph_name;
	}
	public String getPh_ip() {
		return ph_ip;
	}
	public void setPh_ip(String ph_ip) {
		this.ph_ip = ph_ip;
	}
	public String getPh_state() {
		return ph_state;
	}
	public void setPh_state(String ph_state) {
		this.ph_state = ph_state;
	}
	public String getPh_line() {
		return ph_line;
	}
	public void setPh_line(String ph_line) {
		this.ph_line = ph_line;
	}
	public Timestamp getPh_date() {
		return ph_date;
	}
	public void setPh_date(Timestamp ph_date) {
		this.ph_date = ph_date;
	}
	public int getPm_idx() {
		return pm_idx;
	}
	public void setPm_idx(int pm_idx) {
		this.pm_idx = pm_idx;
	}
	
	
	
	
	

}
