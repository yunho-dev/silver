package com.silver.donation;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DonationHisController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DonationHisService service;
	
	
	@GetMapping(value ="/donHistory")
	public ModelAndView donationHistory() {
		ModelAndView mav = new ModelAndView("donation/donHistory");
		return mav;
		
	}
	
	@RequestMapping(value = "/donHistoryCall")
	@ResponseBody
	public HashMap<String, Object>donHistoryCall(@RequestParam int page){
		logger.info("후원금 사용내역 호출");
		return service.donHistoryCall(page);
	}
	
	@RequestMapping(value = "/donHisWriteForm")
	public ModelAndView donHisWriteForm() {
		ModelAndView mav = new ModelAndView("donation/donHisWriteForm");
		logger.info("글쓰기폼 이동");
		return mav;
	}
	
	@RequestMapping(value = "/donWrite")
	public String donWrite (MultipartFile dh_Photo,@RequestParam HashMap<String, String>params){
		logger.info("후원금 작성내역");
		logger.info("params:{}",params);
		logger.info("dhPhoto:{}",dh_Photo);
		
		
		service.donWrite(dh_Photo,params); 
		return "redirect:/donHistory";
	}
	
	@RequestMapping(value = "/donHisUpdateForm")
	public ModelAndView donHisUpdateForm(int dh_idx) {
		logger.info("수정/상세보기폼 이동");
		return service.donHisUpdateForm(dh_idx);
	}
	@RequestMapping(value = "/donHisUpdate")
	public HashMap<String, Object> donHisUpdate (MultipartFile dh_Photo,
			@RequestParam HashMap<String, String>params) {
		logger.info("params:{}",params);
		return service.donHisUpdate(dh_Photo, params);
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
