package com.silver.payment;

import org.apache.ibatis.type.Alias;

@Alias("payformdto")
public class PayFormDTO {

	private int pf_idx;
	private String pf_cate;
	private String pf_write;
	private String pf_content;
	private String pf_subject;
	private int pf_count;
	private String mem_name;
	private String mem_id;
	
	
	
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
	public int getPf_idx() {
		return pf_idx;
	}
	public void setPf_idx(int pf_idx) {
		this.pf_idx = pf_idx;
	}
	public String getPf_cate() {
		return pf_cate;
	}
	public void setPf_cate(String pf_cate) {
		this.pf_cate = pf_cate;
	}
	public String getPf_write() {
		return pf_write;
	}
	public void setPf_write(String pf_write) {
		this.pf_write = pf_write;
	}
	public String getPf_content() {
		return pf_content;
	}
	public void setPf_content(String pf_content) {
		this.pf_content = pf_content;
	}
	public String getPf_subject() {
		return pf_subject;
	}
	public void setPf_subject(String pf_subject) {
		this.pf_subject = pf_subject;
	}
	public int getPf_count() {
		return pf_count;
	}
	public void setPf_count(int pf_count) {
		this.pf_count = pf_count;
	}
	
	
	
}
