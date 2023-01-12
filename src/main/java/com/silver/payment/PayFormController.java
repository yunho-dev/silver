package com.silver.payment;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedCredentialsNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PayFormController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PayFormService payformservice;
	
	public PayFormController(PayFormService payformservice) {
		this.payformservice=payformservice;
	}
	
	@GetMapping(value="/myPayForm")
	public String myPayForm() {
		
		return "payment/myPayForm";
	}
	
	@GetMapping(value="/allPayForm")
	public String allPayForm() {
		
		return "payment/allPayForm";
	}
	
	@ResponseBody
	@GetMapping(value="/mypayformCall")
	public HashMap<String, Object> mypayformCall(@RequestParam int page,HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("타입은222 : "+page);
		int total=payformservice.mylistCallTotal(request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PayFormDTO> payformlist=payformservice.mylistCall(request,page);
		map.put("myformlist", payformlist);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/allpayformCall")
	public HashMap<String, Object> mypayformCall(@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("타입은222 : "+page);
		int total=payformservice.AlllistCallTotal();
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PayFormDTO> allpayformlist=payformservice.alllistCall(page);
		map.put("allformlist", allpayformlist);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@GetMapping(value="/payfromdetail")
	public ModelAndView payfromdetail(@RequestParam int pf_idx) {
		logger.info("pf_idx 값은 : "+pf_idx);
		
		return payformservice.payfromdetail(pf_idx);
	}
	
	@ResponseBody
	@GetMapping(value="/payformdelete")
	public HashMap<String, Object> payformdelete(@RequestParam int idx){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("delete idx 값은 : "+idx);
		int success=payformservice.payformdelete(idx);
		return map;
	}

	@GetMapping(value="/payformupdate.go")
	public ModelAndView payformupdate_go(@RequestParam int pf_idx) {
		
		return payformservice.payformupdate_go(pf_idx);
	}
	
	@PostMapping(value="/payformupdate.do")
	public ModelAndView payformupdate_do(HttpServletRequest request) {
		logger.info("select 값 : "+request.getParameter("selected"));
		logger.info("pf_title 값 : "+request.getParameter("pf_title"));
		logger.info("pf_content 값 : "+request.getParameter("pf_content"));
		return payformservice.payformupdate_do(request);
	}
	
	
	
	

}
