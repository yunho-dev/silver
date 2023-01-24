package com.silver.donation;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView donationHistory(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("후원금 사용내역 리스트 조회");
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		ModelAndView mav = new ModelAndView("donation/donHistory");
		return mav;
		
	}
	
	@RequestMapping(value = "/donHistoryCall")
	@ResponseBody
	public HashMap<String, Object>donHistoryCall(@RequestParam int page){
		logger.info("후원금 사용내역 호출");
		return service.donHistoryCall(page);
	}
	
	@GetMapping(value = "/searchHisdonation")
	@ResponseBody
	public HashMap<String, Object>searchHisdonation(@RequestParam String select, @RequestParam String seacontent,
			@RequestParam int page){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int total = service.searchdonationHisTotal(select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		logger.info("total 값 : "+total);
		logger.info("page_idx 값 : "+page_idx);
		logger.info("select 값 : "+select);
		logger.info("page 값은 : "+page);
		map.put("page_idx", page_idx);
		map.put("list", service.searchHisdonation(select, seacontent,page));
		return map;
		
	}
	
	
	@GetMapping(value = "/donHisWriteForm")
	public ModelAndView donHisWriteForm(Model model) {
		logger.info("글쓰기폼 이동");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "donation");
		
		model.addAttribute("page", map);
		
		
		ModelAndView mav = new ModelAndView("donation/donHisWriteForm");
		return mav;
	}
	
	@PostMapping(value = "/donWrite")
	public String donWrite (MultipartFile dh_Photo,@RequestParam HashMap<String, String>params){
		logger.info("후원금 작성내역");
		logger.info("params:{}",params);
		logger.info("dhPhoto:{}",dh_Photo);
		
		
		service.donWrite(dh_Photo,params); 
		return "redirect:/donHistory";
	}
	
	@RequestMapping(value = "/donHisUpdateForm")
	public ModelAndView donHisUpdateForm(int dh_idx,Model model,@RequestParam HashMap<String, String> params) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "donation");
		
		model.addAttribute("page", map);
		
		
		logger.info("params:{}",params);
		
		logger.info("수정/상세보기폼 이동");
		return service.donHisUpdateForm(dh_idx,params);
	}
	@RequestMapping(value = "/donHisUpdate")
	public String donHisUpdate (MultipartFile dh_Photo,
			@RequestParam HashMap<String, String>params) {
		logger.info("params:{}",params);

		service.donHisUpdate(dh_Photo, params);
		return "redirect:/donHistory";
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
