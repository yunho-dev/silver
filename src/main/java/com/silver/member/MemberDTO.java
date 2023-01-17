package com.silver.member;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_gender;
	private String mem_email;
	private String mem_birth;
	private String mem_pnum;
	private String mem_addr;
	private String mem_daddr;
	private String mem_num;
	private Date mem_indate;
	private Date mem_outdate;
	private String mem_state;
	private int dept_num;
	private int part_num;
	private int pos_num;
	private String pos_name;
	private int pos_level;
	private String part_name;
	private String dept_name;
	private int dept_code;
	private String ce_name;
	private String ce_place;
	private Date ce_date;
	private String ca_name;
	private String ca_work;
	private String ca_pos;
	private Date ca_start;
	private Date ca_end;
	private String edu_name;
	private String edu_pass;
	private String edu_success;
	private Date edu_start;
	private Date edu_end;
	private int si_idx;
	private String si_oriFileName;
	private String si_newFileName;
	private Date si_date;
	private int pe_idx;
	private String pe_content;
	private int fp_idx;
	private String fp_oriFileName;
	private String fp_newFileName;
	private Date fp_date;
	private int dh_idx;
	private int fpc_idx;
	private int th_idx;
	private String fpc_cate;
	private int re_idx;
	private int offset;
	
	private int pm_idx;
	private String pm_subject;
	private int pf_idx;
	private String pm_state;
	private String pf_cate;
	
	private int edu_idx;
	private int ce_idx;
	private int ca_idx;
	
	
	
	
	
	public int getEdu_idx() {
		return edu_idx;
	}
	public void setEdu_idx(int edu_idx) {
		this.edu_idx = edu_idx;
	}
	public int getCe_idx() {
		return ce_idx;
	}
	public void setCe_idx(int ce_idx) {
		this.ce_idx = ce_idx;
	}
	public int getCa_idx() {
		return ca_idx;
	}
	public void setCa_idx(int ca_idx) {
		this.ca_idx = ca_idx;
	}
	public int getPm_idx() {
		return pm_idx;
	}
	public void setPm_idx(int pm_idx) {
		this.pm_idx = pm_idx;
	}
	public String getPm_subject() {
		return pm_subject;
	}
	public void setPm_subject(String pm_subject) {
		this.pm_subject = pm_subject;
	}
	public int getPf_idx() {
		return pf_idx;
	}
	public void setPf_idx(int pf_idx) {
		this.pf_idx = pf_idx;
	}
	public String getPm_state() {
		return pm_state;
	}
	public void setPm_state(String pm_state) {
		this.pm_state = pm_state;
	}
	public String getPf_cate() {
		return pf_cate;
	}
	public void setPf_cate(String pf_cate) {
		this.pf_cate = pf_cate;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getMem_state() {
		return mem_state;
	}
	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}
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
	public Date getSi_date() {
		return si_date;
	}
	public void setSi_date(Date si_date) {
		this.si_date = si_date;
	}
	public int getPe_idx() {
		return pe_idx;
	}
	public void setPe_idx(int pe_idx) {
		this.pe_idx = pe_idx;
	}
	public String getPe_content() {
		return pe_content;
	}
	public void setPe_content(String pe_content) {
		this.pe_content = pe_content;
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
	public Date getFp_date() {
		return fp_date;
	}
	public void setFp_date(Date fp_date) {
		this.fp_date = fp_date;
	}
	public int getDh_idx() {
		return dh_idx;
	}
	public void setDh_idx(int dh_idx) {
		this.dh_idx = dh_idx;
	}
	public int getFpc_idx() {
		return fpc_idx;
	}
	public void setFpc_idx(int fpc_idx) {
		this.fpc_idx = fpc_idx;
	}
	public int getTh_idx() {
		return th_idx;
	}
	public void setTh_idx(int th_idx) {
		this.th_idx = th_idx;
	}
	public String getFpc_cate() {
		return fpc_cate;
	}
	public void setFpc_cate(String fpc_cate) {
		this.fpc_cate = fpc_cate;
	}
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_pnum() {
		return mem_pnum;
	}
	public void setMem_pnum(String mem_pnum) {
		this.mem_pnum = mem_pnum;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_daddr() {
		return mem_daddr;
	}
	public void setMem_daddr(String mem_daddr) {
		this.mem_daddr = mem_daddr;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}
	public Date getMem_indate() {
		return mem_indate;
	}
	public void setMem_indate(Date mem_indate) {
		this.mem_indate = mem_indate;
	}
	public Date getMem_outdate() {
		return mem_outdate;
	}
	public void setMem_outdate(Date mem_outdate) {
		this.mem_outdate = mem_outdate;
	}

	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public int getPart_num() {
		return part_num;
	}
	public void setPart_num(int part_num) {
		this.part_num = part_num;
	}
	public int getPos_num() {
		return pos_num;
	}
	public void setPos_num(int pos_num) {
		this.pos_num = pos_num;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	public int getPos_level() {
		return pos_level;
	}
	public void setPos_level(int pos_level) {
		this.pos_level = pos_level;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getDept_code() {
		return dept_code;
	}
	public void setDept_code(int dept_code) {
		this.dept_code = dept_code;
	}
	public String getCe_name() {
		return ce_name;
	}
	public void setCe_name(String ce_name) {
		this.ce_name = ce_name;
	}
	public String getCe_place() {
		return ce_place;
	}
	public void setCe_place(String ce_place) {
		this.ce_place = ce_place;
	}
	public Date getCe_date() {
		return ce_date;
	}
	public void setCe_date(Date ce_date) {
		this.ce_date = ce_date;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public String getCa_work() {
		return ca_work;
	}
	public void setCa_work(String ca_work) {
		this.ca_work = ca_work;
	}
	public String getCa_pos() {
		return ca_pos;
	}
	public void setCa_pos(String ca_pos) {
		this.ca_pos = ca_pos;
	}
	public Date getCa_start() {
		return ca_start;
	}
	public void setCa_start(Date ca_start) {
		this.ca_start = ca_start;
	}
	public Date getCa_end() {
		return ca_end;
	}
	public void setCa_end(Date ca_end) {
		this.ca_end = ca_end;
	}
	public String getEdu_name() {
		return edu_name;
	}
	public void setEdu_name(String edu_name) {
		this.edu_name = edu_name;
	}
	public String getEdu_pass() {
		return edu_pass;
	}
	public void setEdu_pass(String edu_pass) {
		this.edu_pass = edu_pass;
	}
	public String getEdu_success() {
		return edu_success;
	}
	public void setEdu_success(String edu_success) {
		this.edu_success = edu_success;
	}
	public Date getEdu_start() {
		return edu_start;
	}
	public void setEdu_start(Date edu_start) {
		this.edu_start = edu_start;
	}
	public Date getEdu_end() {
		return edu_end;
	}
	public void setEdu_end(Date edu_end) {
		this.edu_end = edu_end;
	}
	
	
	
	
	
	
	
	
	

}
