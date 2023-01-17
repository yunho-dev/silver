package com.silver.resident;

import org.apache.ibatis.type.Alias;

@Alias("procategory")
public class ResidentProgramGategoryDTO {
	
	private int pc_idx;
	private String pc_cate;
	
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
