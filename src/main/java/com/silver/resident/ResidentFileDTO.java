package com.silver.resident;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("rdfile")
public class ResidentFileDTO {

	private int re_idx;
	private int  fp_idx;
	private int  fpc_idx;
	private String  fp_oriFileName;
	private String  fp_newFileName;
	private Timestamp  fp_date;
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
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
	
	
}
