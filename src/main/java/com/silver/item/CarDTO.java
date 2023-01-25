package com.silver.item;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("car")
public class CarDTO {
	
	//차량 조회
	private int car_idx;
	private int it_idx;
	private String car_name;
	private String car_num;
	private String car_state;
	private String car_part;
	private String car_type;
	private String car_year;
	//운행기록
	private int chis_idx;
	private Date chis_date;
	private String chis_driver;
	private String chis_place;
	private String chis_reason;
	private int chis_km;
	private int chis_liter;
	private String chis_bigo;
	//운행 예약
	private int cb_idx;
	private String b_write;
	private String b_start;
	private String b_end;
	private String b_content;
	private String mem_id;
	private String mem_name;
	private int b_cancel;
	
	public int getCar_idx() {
		return car_idx;
	}
	public void setCar_idx(int car_idx) {
		this.car_idx = car_idx;
	}
	public int getIt_idx() {
		return it_idx;
	}
	public void setIt_idx(int it_idx) {
		this.it_idx = it_idx;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getCar_state() {
		return car_state;
	}
	public void setCar_state(String car_state) {
		this.car_state = car_state;
	}
	public String getCar_part() {
		return car_part;
	}
	public void setCar_part(String car_part) {
		this.car_part = car_part;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public String getCar_year() {
		return car_year;
	}
	public void setCar_year(String car_year) {
		this.car_year = car_year;
	}
	public int getChis_idx() {
		return chis_idx;
	}
	public void setChis_idx(int chis_idx) {
		this.chis_idx = chis_idx;
	}
	public Date getChis_date() {
		return chis_date;
	}
	public void setChis_date(Date chis_date) {
		this.chis_date = chis_date;
	}
	public String getChis_driver() {
		return chis_driver;
	}
	public void setChis_driver(String chis_driver) {
		this.chis_driver = chis_driver;
	}
	public String getChis_place() {
		return chis_place;
	}
	public void setChis_place(String chis_place) {
		this.chis_place = chis_place;
	}
	public String getChis_reason() {
		return chis_reason;
	}
	public void setChis_reason(String chis_reason) {
		this.chis_reason = chis_reason;
	}
	public int getChis_km() {
		return chis_km;
	}
	public void setChis_km(int chis_km) {
		this.chis_km = chis_km;
	}
	public int getChis_liter() {
		return chis_liter;
	}
	public void setChis_liter(int chis_liter) {
		this.chis_liter = chis_liter;
	}
	public String getChis_bigo() {
		return chis_bigo;
	}
	public void setChis_bigo(String chis_bigo) {
		this.chis_bigo = chis_bigo;
	}
	public int getCb_idx() {
		return cb_idx;
	}
	public void setCb_idx(int cb_idx) {
		this.cb_idx = cb_idx;
	}
	public String getB_write() {
		return b_write;
	}
	public void setB_write(String b_write) {
		this.b_write = b_write;
	}
	public String getB_start() {
		return b_start;
	}
	public void setB_start(String b_start) {
		this.b_start = b_start;
	}
	public String getB_end() {
		return b_end;
	}
	public void setB_end(String b_end) {
		this.b_end = b_end;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
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
	public int getB_cancel() {
		return b_cancel;
	}
	public void setB_cancel(int b_cancel) {
		this.b_cancel = b_cancel;
	}

}
