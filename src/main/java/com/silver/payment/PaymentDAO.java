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


	ArrayList<PaymentDTO> PayFile(int pm_idx);

	int MySangSin(PaymentDTO payDto);

	String WhoFirst(int pm_idx);

	ArrayList<String> referPmIdx(String mem_id);
	
//	ArrayList<PaymentDTO> openPayment(String str);
	
	ArrayList<PaymentDTO> openPayment(int page, ArrayList<String> referPmIdx);

	int OpensListCallTotal(ArrayList<String> referPmIdx);
	
	String SignImg(String mem_id);

	String MySign(String mem_id);

//	ArrayList<PaymentDTO> FirstWaitPayment(String mem_id);

	ArrayList<String> pmSelfOne(String mem_id);

	ArrayList<PaymentDTO> WaitPm();

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

	int finishpaymentTotal_ajax(String mem_id);

	ArrayList<PaymentDTO> finishpayment_ajax(String mem_id, int page);

	int selfSearchTotal(String select, String seacontent, String seacontent2);

	ArrayList<PaymentDTO> selfSearch(String select, String seacontent, String seacontent2, int page);

	int goingSearchTotal(String mem_id, String select, String seacontent);

	ArrayList<PaymentDTO> goingSearch(String mem_id, String select, String seacontent, int page);

	int finishSearchTotal(String mem_id, String select, String seacontent);

	ArrayList<PaymentDTO> finishSearch(String mem_id, String select, String seacontent, int page);

	int waitpaymentTotal_ajax();

	int openSearchPayment(String select, String seacontent, ArrayList<String> referPmIdx);

	ArrayList<PaymentDTO> openpaymentSearch_ajax(String select, String seacontent, int page,
			ArrayList<String> referPmIdx);

	String getDownloadOrlName(String path);









}
