package com.silver.payment;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayFormDAO {

	ArrayList<PayFormDTO> mylistCall(String mem_id, int page);

	int mylistCallTotal(String mem_id);

	int AlllistCallTotal();

	ArrayList<PayFormDTO> alllistCall(int page);

	PayFormDTO payfromdetail(int pf_idx);

	int payformdelete(int idx);

	void payformupdate_do(String pf_idx, String selected, String pf_title, String pf_content);

	void writepayForm_do(PayFormDTO payformDTO);

	int AllFormSearchTotal(String select, String seacontent);

	ArrayList<PayFormDTO> AllFormSearch(String select, String seacontent, int page);




}
