package com.silver.resident;

import org.apache.ibatis.type.Alias;

@Alias("room")
public class RoomDTO {
	
	private String ro_name;
	private String ro_floor;
	private String ro_damdang;
	private int ro_full;
	private String re_name;
	private String mem_name;
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getRo_name() {
		return ro_name;
	}
	public void setRo_name(String ro_name) {
		this.ro_name = ro_name;
	}
	public String getRo_floor() {
		return ro_floor;
	}
	public void setRo_floor(String ro_floor) {
		this.ro_floor = ro_floor;
	}
	public String getRo_damdang() {
		return ro_damdang;
	}
	public void setRo_damdang(String ro_damdang) {
		this.ro_damdang = ro_damdang;
	}
	public int getRo_full() {
		return ro_full;
	}
	public void setRo_full(int ro_full) {
		this.ro_full = ro_full;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	
	

	
	
}
