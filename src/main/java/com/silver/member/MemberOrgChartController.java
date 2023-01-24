package com.silver.member;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MemberOrgChartController {
	Logger logger=LoggerFactory.getLogger(getClass());
	@Autowired MemberOrgChartService service;
	
	
	@GetMapping(value = "/memberOrgChart")
	public ModelAndView donation(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("조직도 조회");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		ModelAndView mav = new ModelAndView("member/memberorgchartList");
		return mav;
	}
	
	@GetMapping(value = "memberOrgChartCall")
	public HashMap<String, Object>orgList(){
		HashMap<String, Object>map
		= new HashMap<String, Object>();
		logger.info("조직도 호출");
		map.put("memberOrgChartCall", service.memberOrgChartCall());
		return map;
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
