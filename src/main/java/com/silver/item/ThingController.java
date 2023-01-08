package com.silver.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ThingController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ThingService service;
	
	public ThingController(ThingService service) {
		this.service = service;
	}
	
	@GetMapping(value={"/","/silverMain"})
	   public String index() {
	      logger.info("부트스트랩 테스트");
	      return "main/silverMain";
	}
	
	@GetMapping(value = "/thingList")
	public String thingList() {
		return "item/thingList";
	}
	
	
	@GetMapping(value = "/getThingList.do")
	@ResponseBody
	public HashMap<String, Object> getThingList(int page){
		logger.info(page+"페이지 ajax 데이터 요청");
		return service.getThingList(page);
	}
	
	@GetMapping(value = "/getThingListSearch.do")
	@ResponseBody
	public HashMap<String, Object> getThingListSearch(@RequestParam HashMap<String, String> params){
		logger.info("params : {} ", params);
		return service.getThingListSearch(params);
	}
	
	@GetMapping(value = "/getThingDetail.do")
	@ResponseBody
	public HashMap<String, Object> getThingDetail(String thIdx){
		logger.info(thIdx+"번째 비품에 대한 상세보기 요청");
		return service.getThingDetail(thIdx);
	}
	
	@PostMapping(value = "/thingWrite.do")
	@ResponseBody
	public HashMap<String, Object> regist(MultipartFile thPhoto, @RequestParam HashMap<String, String> params){
		return service.thingWrite(thPhoto, params);
	}
	
	@GetMapping(value = "/itemCateList.do")
	public ModelAndView itemCate() {
		logger.info("비품 카테고리 조회 요청");
		return service.itemCateList();
	}
	
	@GetMapping(value = "/thingCheck.do")
	@ResponseBody
	public HashMap<String, Object> thingCheck(String thName) {
		boolean thingCheck = true;
		thingCheck = service.thingCheck(thName);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("thingCheck", thingCheck);
		return result;
	}

}
