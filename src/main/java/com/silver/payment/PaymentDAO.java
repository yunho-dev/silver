package com.silver.payment;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {

	ArrayList<PaymentDTO> MyPayListCall(String mem_id, int page);

	int MyPayListCallTotal(String mem_id);

	ArrayList<PayFormDTO> modalPayFormList(String payFormDropDown);

	ArrayList<PaymentDTO> PayMentReferCho_ajax();

	ArrayList<PaymentDTO> referDept();

	ArrayList<PaymentDTO> PayOrgCall(int selfMem_Pos);

}
