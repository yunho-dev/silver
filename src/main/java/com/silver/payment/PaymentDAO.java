package com.silver.payment;

import java.util.ArrayList;
import java.util.Collection;

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

//	 ArrayList<MemberDTO> paysign(ArrayList<String> signMember);

	ArrayList<PaymentDTO> PayFile(int pm_idx);

	int MySangSin(PaymentDTO payDto);

	String WhoFirst(int pm_idx);


	ArrayList<String> referPmIdx(String mem_id);
	
	ArrayList<PaymentDTO> openPayment(String str);

	String SignImg(String mem_id);

	String MySign(String mem_id);

//	ArrayList<PaymentDTO> FirstWaitPayment(String mem_id);

	ArrayList<String> pmSelfOne(String mem_id);

	ArrayList<PaymentDTO> WaitPm(String mem_id, int mem_posLevel);

	void GoPayment(PaymentDTO payDto);

	void PmChange(PaymentDTO payDto);

	String isNext(PaymentDTO payDto);

	int FinishPayment(PaymentDTO payDto);

	ArrayList<String> FinishAlarmSearch(PaymentDTO payDto);

	void PayFormUpCnt(PaymentDTO payDto);

	String writePayMent(PaymentDTO payDto);

	void PmBackChange(PaymentDTO payDto);

	int FinishBackPayment(PaymentDTO payDto);

	ArrayList<String> FinishBackAlarmSearch(PaymentDTO payDto);

	String paymentdao(String mem_id);

	ArrayList<String> pl_hp(int pm_idx);

	ArrayList<PaymentDTO> AnotherSign(ArrayList<String> pl_hp);

	String MyWriteSign(String mem_id);

	String writePayMent_memId(PaymentDTO payDto);

	ArrayList<PaymentDTO> goingpayment_ajax(String mem_id, int page);

	int goingpaymentTotal_ajax(String mem_id);




}
