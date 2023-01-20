package com.silver.payment;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.type.Alias;

@Alias("payment")
public class PaymentDTO {
	private String mem_id;
	private int pm_idx;
	private String pm_dept;
	private Timestamp pm_date;
	private int pm_self;
	private String pm_bigo;
	private int pm_open;
	private String pm_subject;
	private String pm_content;
	private String pm_state;
	private int pf_idx;
	private Timestamp ho_start;
	private Timestamp ho_end;
	private int paf_idx;
	private String paf_oriFileName;
	private String paf_newFileName;
	private int pl_idx;
	private String pl_hp;
	private int pl_ch;
	private Timestamp pl_date;
	private int pl_level;
	private int par_idx;
	private String par_name;
	private String mem_name;
	private String pf_cate;
	private String pf_write;
	private String pf_content;
	private String pf_subject;
	private String mem_state;
	private String dept_name;
	private String pos_name;
	private String ho_type;
	private int dept_code;
	private int pos_level;
	private int dept_num;
	private int si_idx;
	private String si_oriFileName;
	private String si_newFileName;
	
	
	public int getSi_idx() {
		return si_idx;
	}
	public void setSi_idx(int si_idx) {
		this.si_idx = si_idx;
	}
	public String getSi_oriFileName() {
		return si_oriFileName;
	}
	public void setSi_oriFileName(String si_oriFileName) {
		this.si_oriFileName = si_oriFileName;
	}
	public String getSi_newFileName() {
		return si_newFileName;
	}
	public void setSi_newFileName(String si_newFileName) {
		this.si_newFileName = si_newFileName;
	}
	private ArrayList<String> resultList=new ArrayList<String>();
	
	
	public String getHo_type() {
		return ho_type;
	}
	public ArrayList<String> getResultList() {
		return resultList;
	}
	public void setResultList(ArrayList<String> resultList) {
		this.resultList = resultList;
	}
	public void setHo_type(String ho_type) {
		this.ho_type = ho_type;
	}
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
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
	private int pf_count;
	
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
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getPf_cate() {
		return pf_cate;
	}
	public void setPf_cate(String pf_cate) {
		this.pf_cate = pf_cate;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPm_idx() {
		return pm_idx;
	}
	public void setPm_idx(int pm_idx) {
		this.pm_idx = pm_idx;
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
	public int getPm_self() {
		return pm_self;
	}
	public void setPm_self(int pm_self) {
		this.pm_self = pm_self;
	}
	public String getPm_bigo() {
		return pm_bigo;
	}
	public void setPm_bigo(String pm_bigo) {
		this.pm_bigo = pm_bigo;
	}
	public int getPm_open() {
		return pm_open;
	}
	public void setPm_open(int pm_open) {
		this.pm_open = pm_open;
	}
	public String getPm_subject() {
		return pm_subject;
	}
	public void setPm_subject(String pm_subject) {
		this.pm_subject = pm_subject;
	}
	public String getPm_content() {
		return pm_content;
	}
	public void setPm_content(String pm_content) {
		this.pm_content = pm_content;
	}
	public String getPm_state() {
		return pm_state;
	}
	public void setPm_state(String pm_state) {
		this.pm_state = pm_state;
	}
	public int getPf_idx() {
		return pf_idx;
	}
	public void setPf_idx(int pf_idx) {
		this.pf_idx = pf_idx;
	}
	public Timestamp getHo_start() {
		return ho_start;
	}
	public void setHo_start(Timestamp ho_start) {
		this.ho_start = ho_start;
	}
	public Timestamp getHo_end() {
		return ho_end;
	}
	public void setHo_end(Timestamp ho_end) {
		this.ho_end = ho_end;
	}
	public int getPaf_idx() {
		return paf_idx;
	}
	public void setPaf_idx(int paf_idx) {
		this.paf_idx = paf_idx;
	}
	public String getPaf_oriFileName() {
		return paf_oriFileName;
	}
	public void setPaf_oriFileName(String paf_oriFileName) {
		this.paf_oriFileName = paf_oriFileName;
	}
	public String getPaf_newFileName() {
		return paf_newFileName;
	}
	public void setPaf_newFileName(String paf_newFileName) {
		this.paf_newFileName = paf_newFileName;
	}
	public int getPl_idx() {
		return pl_idx;
	}
	public void setPl_idx(int pl_idx) {
		this.pl_idx = pl_idx;
	}
	public String getPl_hp() {
		return pl_hp;
	}
	public void setPl_hp(String pl_hp) {
		this.pl_hp = pl_hp;
	}
	public int getPl_ch() {
		return pl_ch;
	}
	public void setPl_ch(int pl_ch) {
		this.pl_ch = pl_ch;
	}
	public Timestamp getPl_date() {
		return pl_date;
	}
	public void setPl_date(Timestamp pl_date) {
		this.pl_date = pl_date;
	}
	public int getPl_level() {
		return pl_level;
	}
	public void setPl_level(int pl_level) {
		this.pl_level = pl_level;
	}
	public int getPar_idx() {
		return par_idx;
	}
	public void setPar_idx(int par_idx) {
		this.par_idx = par_idx;
	}
	public String getPar_name() {
		return par_name;
	}
	public void setPar_name(String par_name) {
		this.par_name = par_name;
	}
	
	
}
