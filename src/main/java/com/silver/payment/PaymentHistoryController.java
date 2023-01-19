package com.silver.payment;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class PaymentHistoryController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PaymentHistoryService phservice;
	
	public PaymentHistoryController(PaymentHistoryService phservice) {
		
		this.phservice=phservice;
	}
	
	@ResponseBody
	@GetMapping(value="/PayHistory.ajax")
	public HashMap<String, Object> PayHistory_ajax(@RequestParam int pm_idx){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PaymentHistoryDTO> hisList=phservice.hisList(pm_idx);
		map.put("hisList", hisList);
		return map;
	}

}
