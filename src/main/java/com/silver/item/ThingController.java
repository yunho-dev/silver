package com.silver.item;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ThingController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ThingService service;
	
	public ThingController(ThingService service) {
		this.service = service;
	}
	
	@GetMapping(value = "/thingList")
	public ModelAndView thingList() {
		ModelAndView mav = new ModelAndView("item/thingList");
		return mav;
	}
	
	@GetMapping(value = "/getThingList.do")
	public HashMap<String, Object> getThingList(int page){
		logger.info(page+"페이지 리스트(ajax) 데이터 요청");
		return service.getThingList(page);
	}
	
	@GetMapping(value = "/getThingListSearch.do")
	public HashMap<String, Object> getThingListSearch(@RequestParam HashMap<String, String> params){
		logger.info(params.get("page")+"페이지 검색결과(ajax) 데이터 요청");
		return service.getThingListSearch(params);
	}
	
	@GetMapping(value = "/getThingDetail.do")
	public HashMap<String, Object> getThingDetail(String thIdx){
		logger.info(thIdx+"번째 비품에 대한 상세보기 요청");
		return service.getThingDetail(thIdx);
	}
	
	@PostMapping(value = "/thingWrite.do")
	public HashMap<String, Object> thingWrite(MultipartFile thPhoto, @RequestParam HashMap<String, String> params, HttpServletRequest request){
		return service.thingWrite(thPhoto, params, request);
	}
	
	@GetMapping(value = "/thingCheck.do")
	public HashMap<String, Object> thingCheck(String thName) {
		boolean thingCheck = true;
		thingCheck = service.thingCheck(thName);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("thingCheck", thingCheck);
		return result;
	}
	
	@PostMapping(value = "/thingUpdate.do")
	public HashMap<String, Object> thingUpdate(MultipartFile thPhoto, @RequestParam HashMap<String, String> params, HttpServletRequest request){
		logger.info("비품 수정 접근");
		return service.thingUpdate(thPhoto, params, request);
	}
	
	/*
	@GetMapping(value = "/itemCateList.do")
	public ModelAndView itemCate() {
		logger.info("비품 카테고리 조회 요청");
		return service.itemCateList();
	}
	*/
	@GetMapping(value = "/itemCateList.go")
	public ModelAndView itemCate() {
		ModelAndView mav = new ModelAndView("item/itemCateList");
		return mav;
	}
	
	@GetMapping(value = "/itemCateList.do")
	public HashMap<String, Object> itemCateList(){
		return service.itemCateList();
	}
	
	
	@GetMapping(value = "/itemCateWrite.go")
	public ModelAndView itemCateWrite() {
		logger.info("hi");
		ModelAndView mav = new ModelAndView("item/itemCateWrite");
		return mav;
	}
	
	@GetMapping(value = "/cateNameCheck.do")
	public HashMap<String, Object> cateNameCheck(String cateName){
		logger.info("카테고리 등록 접근");
		logger.info("받아온 이름 : "+cateName);
		boolean cateCheck = true;
		cateCheck = service.cateNameCheck(cateName);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("cateCheck", cateCheck);
		return result;
	}
	
	@GetMapping(value = "/itemCateResist.do")
	public HashMap<String, Object> itemCateResist(String cateName) {
		return service.itemCateResist(cateName);
	}
	
	@GetMapping(value = "/itemCateUpdate.do")
	public HashMap<String, Object> itemCateUpdate(int itIdx, String cateName) {
		return service.itemCateUpdate(itIdx, cateName);
	}

}
