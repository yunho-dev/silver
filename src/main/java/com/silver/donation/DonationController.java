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
	public ModelAndView donation(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("후원금 리스트 조회");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		ModelAndView mav = new ModelAndView("donation/donation");
		return mav;
	}
	
	@RequestMapping(value = "/donationListCall")
	@ResponseBody
	public HashMap<String, Object> donationListCall(@RequestParam int page) {
		logger.info("후원금 리스트 호출");
		return service.donationListCall(page);
	}
	
	@GetMapping(value = "/searchdonation")
	@ResponseBody
	public HashMap<String, Object>searchdonation(@RequestParam String select, @RequestParam String seacontent,
			@RequestParam int page){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int total = service.searchdonationTotal(select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		logger.info("total 값 : "+total);
		logger.info("page_idx 값 : "+page_idx);
		logger.info("select 값 : "+select);
		logger.info("page 값은 : "+page);
		map.put("page_idx", page_idx);
		map.put("list", service.searchdonation(select, seacontent,page));
		return map;
		
	}
	
	@GetMapping(value = "/donationWriteForm")
	public ModelAndView donationWriteForm(Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "donation");
		
		model.addAttribute("page", map);
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
	public ModelAndView donationUpdateForm(Model model,int do_idx) {
		logger.info("수정폼 이동");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "donation");
		
		model.addAttribute("page", map);
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
