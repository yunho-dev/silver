package com.silver.payment;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.silver.member.MemberDTO;

@Mapper
public interface PaymentDAO {

	ArrayList<PaymentDTO> MyPayListCall(String mem_id, int page);

	int MyPayListCallTotal(String mem_id);

	ArrayList<PayFormDTO> modalPayFormList(String payFormDropDown);

	ArrayList<PaymentDTO> PayMentReferCho_ajax();

	ArrayList<PaymentDTO> referDept();

	ArrayList<PaymentDTO> PayOrgCall(int selfMem_Pos);

	int PayMentInsert_First(PaymentDTO payDto);

	void PayMentHoli(PaymentDTO payDto);

	ArrayList<String> TeamMember(String deptName);

	void AddRefer(PaymentDTO paymentdto);

	void FileUpload(int pm_idx, String oriFileName, String newFileName);

	String GetDept(String str);

	void insertLine(String getDept, String str, int pm_idx);

	PaymentDTO detailPayment_do(int pm_idx);

	ArrayList<PaymentDTO> ReferDto(int pm_idx);

	ArrayList<PaymentDTO> PmlineDto(int pm_idx);

	// ArrayList<String> SignMember(int pm_idx);

	// ArrayList<MemberDTO> paysign(ArrayList<String> signMember);

	ArrayList<PaymentDTO> PayFile(int pm_idx);

	int MySangSin(PaymentDTO payDto);

	String WhoFirst(int pm_idx);

	String MySign(String mem_id);

	ArrayList<String> referPmIdx(String mem_id);
	
	ArrayList<PaymentDTO> openPayment(String str);

}
