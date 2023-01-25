package com.silver.mycal;

import org.apache.ibatis.type.Alias;

@Alias("mycal")
public class MycalDTO {
	private String mem_id;
	private int cal_idx;
	private String cal_cate;
	private String cal_allday;
	private String cal_start;
	private String cal_end;
	
	private String title;
	private String allDay;
	private String start;
	private String end;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCal_idx() {
		return cal_idx;
	}
	public void setCal_idx(int cal_idx) {
		this.cal_idx = cal_idx;
	}
	public String getCal_cate() {
		return cal_cate;
	}
	public void setCal_cate(String cal_cate) {
		this.cal_cate = cal_cate;
	}
	public String getCal_allday() {
		return cal_allday;
	}
	public void setCal_allday(String cal_allday) {
		this.cal_allday = cal_allday;
	}
	public String getCal_start() {
		return cal_start;
	}
	public void setCal_start(String cal_start) {
		this.cal_start = cal_start;
	}
	public String getCal_end() {
		return cal_end;
	}
	public void setCal_end(String cal_end) {
		this.cal_end = cal_end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}

	

	
	
}
