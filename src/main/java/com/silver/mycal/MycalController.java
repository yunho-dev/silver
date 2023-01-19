package com.silver.mycal;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MycalController {
	
	@Autowired MycalService service;
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
    // 개인캘린더 이동 페이지	
	@GetMapping(value="/mycalList")
	public String sidebar(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("개인 캘린더 조회");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		
		return "/mycal/mycalList";
	}

}
