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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("SelfMem_name",mem_name);
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
	
	
}
