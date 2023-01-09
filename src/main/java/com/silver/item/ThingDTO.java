package com.silver.item;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("thing")
public class ThingDTO {
	private int th_idx;
	private String th_name;
	private String th_part;
	private Date th_date;
	private String th_model;
	private int th_money;
	private String th_write;
	private String th_spon;
	private String th_state;
	//history
	private String his_write;
	private String his_name;
	private Date his_rent;
	private Date his_return;
	private String his_goal;
	private String his_bigo;
	//photo
	private int fp_idx;
	private String fp_oriFileName;
	private String fp_newFileName;
	private Timestamp fp_date;
	private int fpc_idx;
	//category
	private int it_idx;
	
	public int getTh_idx() {
		System.out.println(th_idx);
		return th_idx;
	}
	public void setTh_idx(int th_idx) {
		this.th_idx = th_idx;
	}
	public int getIt_idx() {
		return it_idx;
	}
	public void setIt_idx(int it_idx) {
		this.it_idx = it_idx;
	}
	public String getTh_name() {
		return th_name;
	}
	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}
	public String getTh_part() {
		return th_part;
	}
	public void setTh_part(String th_part) {
		this.th_part = th_part;
	}
	public Date getTh_date() {
		return th_date;
	}
	public void setTh_date(Date th_date) {
		this.th_date = th_date;
	}
	public String getTh_model() {
		return th_model;
	}
	public void setTh_model(String th_model) {
		this.th_model = th_model;
	}
	public int getTh_money() {
		return th_money;
	}
	public void setTh_money(int th_money) {
		this.th_money = th_money;
	}
	public String getTh_write() {
		return th_write;
	}
	public void setTh_write(String th_write) {
		this.th_write = th_write;
	}
	public String getTh_spon() {
		return th_spon;
	}
	public void setTh_spon(String th_spon) {
		this.th_spon = th_spon;
	}
	public String getTh_state() {
		return th_state;
	}
	public void setTh_state(String th_state) {
		this.th_state = th_state;
	}
	public String getHis_write() {
		return his_write;
	}
	public void setHis_write(String his_write) {
		this.his_write = his_write;
	}
	public String getHis_name() {
		return his_name;
	}
	public void setHis_name(String his_name) {
		this.his_name = his_name;
	}
	public Date getHis_rent() {
		return his_rent;
	}
	public void setHis_rent(Date his_rent) {
		this.his_rent = his_rent;
	}
	public Date getHis_return() {
		return his_return;
	}
	public void setHis_return(Date his_return) {
		this.his_return = his_return;
	}
	public String getHis_goal() {
		return his_goal;
	}
	public void setHis_goal(String his_goal) {
		this.his_goal = his_goal;
	}
	public String getHis_bigo() {
		return his_bigo;
	}
	public void setHis_bigo(String his_bigo) {
		this.his_bigo = his_bigo;
	}
	public int getFp_idx() {
		return fp_idx;
	}
	public void setFp_idx(int fp_idx) {
		this.fp_idx = fp_idx;
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
	public int getFpc_idx() {
		return fpc_idx;
	}
	public void setFpc_idx(int fpc_idx) {
		this.fpc_idx = fpc_idx;
	}
	
}