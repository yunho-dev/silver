package com.silver.payment;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;

@Controller
public class PaymentController {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PaymentService paymentservice;
	
	public PaymentController(PaymentService paymentservice) {
		this.paymentservice=paymentservice;
	}
	
	
	@GetMapping(value="/selfPayment")
	public String selfPayment_go(){
		
		return "payment/selfPayment";
	}
	
	@ResponseBody
	@GetMapping(value="/selfpayment.ajax")
	public HashMap<String, Object> selfpayment_ajax(HttpServletRequest request,@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=paymentservice.MyPayListCallTotal(request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> paymentList=paymentservice.MyPayListCall(request,page);
		map.put("paymentList", paymentList);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@GetMapping(value="/paymentwrite.go")
	public String paymentwrite_go(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_name=memberDTO.getMem_name();
		int mem_posLevel=memberDTO.getPos_level();
		logger.info("pos 레벨 : "+mem_posLevel);
		model.addAttribute("SelfMem_name",mem_name);
		model.addAttribute("mem_posLevel",mem_posLevel);
		return "payment/writePayment";
	}
	
	@ResponseBody
	@GetMapping(value="/WritePayformCall.ajax")
	public HashMap<String, Object> WritePayformCall_ajax(@RequestParam String payFormDropDown){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PayFormDTO> modalPayFormList=paymentservice.modalPayFormList(payFormDropDown);
		map.put("modalPayFormList", modalPayFormList);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/PayMentReferCho.ajax")
	public HashMap<String, Object> PayMentReferCho_ajax(){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PaymentDTO> refercho=paymentservice.PayMentReferCho_ajax();
		ArrayList<PaymentDTO> referDept=paymentservice.referDept();
		map.put("refercho", refercho);
		map.put("referDept", referDept);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/PayOrgCall.ajax")
	public HashMap<String, Object> PayOrgCall_ajax(@RequestParam int SelfMem_Pos){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("SelfMem_Pos"+SelfMem_Pos);
		ArrayList<PaymentDTO> PayOrgCall=paymentservice.PayOrgCall(SelfMem_Pos);
		ArrayList<PaymentDTO> OrgDept=paymentservice.referDept();
		map.put("PayOrgCall", PayOrgCall);
		map.put("OrgDept", OrgDept);
		return map;
	}
	
	@PostMapping(value="/PayMentInsert.do")
	public ModelAndView PayMentInsert_do(@RequestParam String payFormDropDown,HttpServletRequest request) {
		logger.info("결재 양식"+request.getParameter("payFormDropDown"));
		logger.info("휴가 종류"+request.getParameter("vacationDrop"));
		logger.info("휴가 시작 날짜"+request.getParameter("FirstVacationDate"));
		logger.info("휴가 끝 날짜"+request.getParameter("SecondVacationDate"));
		logger.info("팀 오픈"+request.getParameter("openchk"));
		logger.info("참조자"+request.getParameter("ReferinsertInput"));
		logger.info("내용"+request.getParameter("wp_content"));
		logger.info("결재 라인"+request.getParameter("OrgPmSelected"));
		
		return null;
		//return paymentservice.PayMentInsert_do(request);
	}
	
	
}
