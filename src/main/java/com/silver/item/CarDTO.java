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

}
