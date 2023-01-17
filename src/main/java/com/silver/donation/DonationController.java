package com.silver.donation;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DonationController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DonationService service;
	
	@GetMapping(value = "/donation")
	public ModelAndView donation() {
		ModelAndView mav = new ModelAndView("donation/donation");
		return mav;
	}
	
	@RequestMapping(value = "/donationListCall")
	@ResponseBody
	public HashMap<String, Object> donationListCall(@RequestParam int page) {
		logger.info("후원금 리스트 호출");
		return service.donationListCall(page);
	}
	
	@GetMapping(value = "/donationWriteForm")
	public ModelAndView donationWriteForm() {
		ModelAndView mav = new ModelAndView("donation/donationWriteForm");
		return mav;
	}
	
	@RequestMapping(value = "/donationWrite",method = RequestMethod.POST )
	public String donationWrite(Model model,
			@RequestParam HashMap<String, String>params) {
		logger.info("params:{}",params);
		service.donationWrite(params);
		
		return "redirect:/donation";
		
	}
	
	@RequestMapping(value = "/donationUpdateForm")
	public ModelAndView donationUpdateForm(int do_idx) {
		logger.info("수정폼 이동");
		logger.info("do_idx",do_idx);
		return service.donationUpdateForm(do_idx);
	}
	
	@RequestMapping(value = "/donationUpdate")
	public String donationUpdate(
		@RequestParam HashMap<String, String>params) {
		logger.info("params:{}"+params);
		service.donationUpdate(params);
		String do_idx = params.get("do_idx");
		return "redirect:/donation?";
		
	}















}
