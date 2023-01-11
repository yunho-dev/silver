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
	
	/* 비품 목록 이동 */
	@GetMapping(value = "/thingList")
	public ModelAndView thingList() {
		ModelAndView mav = new ModelAndView("item/thingList");
		return mav;
	}
	
	/* 비품 목록 리스트 */
	@GetMapping(value = "/getThingList.do")
	public HashMap<String, Object> getThingList(int page){
		logger.info("비품목록 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.getThingList(page);
	}
	
	/* 비품 검색 리스트 */
	@GetMapping(value = "/getThingListSearch.do")
	public HashMap<String, Object> getThingListSearch(@RequestParam HashMap<String, String> params){
		logger.info(params.get("비품목록 검색 "+"page")+"페이지 검색결과(ajax) 데이터 요청");
		return service.getThingListSearch(params);
	}
	
	/* 비품 상세보기 */
	@GetMapping(value = "/getThingDetail.do")
	public HashMap<String, Object> getThingDetail(String thIdx){
		logger.info(thIdx+"번째 비품에 대한 상세보기 요청");
		return service.getThingDetail(thIdx);
	}
	
	/* 비품 등록 */
	@PostMapping(value = "/thingWrite.do")
	public HashMap<String, Object> thingWrite(MultipartFile thPhoto, @RequestParam HashMap<String, String> params, HttpServletRequest request){
		return service.thingWrite(thPhoto, params, request);
	}
	
	/* 비품 등록 - 중복체크 */
	@GetMapping(value = "/thingCheck.do")
	public HashMap<String, Object> thingCheck(String thName) {
		logger.info("비품명 중복 체크 요청");
		boolean thingCheck = true;
		thingCheck = service.thingCheck(thName);
		logger.info("비품명 중복 여부(false : 중복없음) : "+thingCheck);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("thingCheck", thingCheck);
		return result;
	}
	
	/* 비품 수정 */
	@PostMapping(value = "/thingUpdate.do")
	public HashMap<String, Object> thingUpdate(MultipartFile thPhoto, @RequestParam HashMap<String, String> params, HttpServletRequest request){
		logger.info("비품 수정 접근");
		return service.thingUpdate(thPhoto, params, request);
	}
	
	/* 카테고리 리스트 이동 */
	@GetMapping(value = "/itemCateList.go")
	public ModelAndView itemCate() {
		ModelAndView mav = new ModelAndView("item/itemCateList");
		return mav;
	}
	
	/* 카테고리 리스트 */
	@GetMapping(value = "/itemCateList.do")
	public HashMap<String, Object> itemCateList(){
		return service.itemCateList();
	}
	
	/* 카테고리 리스트 - 필터 검색 */
	@GetMapping(value = "/getItemSearch.do")
	public HashMap<String, Object> getItemSearch(String itName){
		logger.info("카테고리명 : "+itName+" 에 대한 검색 요청 받음");
		return service.getItemSearch(itName);
	}
	
	/* 카테고리 리스트 등록 이동 */
	@GetMapping(value = "/itemCateWrite.go")
	public ModelAndView itemCateWrite() {
		ModelAndView mav = new ModelAndView("item/itemCateWrite");
		return mav;
	}
	
	/* 카테고리 등록 */
	@GetMapping(value = "/itemCateResist.do")
	public HashMap<String, Object> itemCateResist(String cateName) {
		return service.itemCateResist(cateName);
	}
	
	/* 카테고리 등록 - 중복 체크 */
	@GetMapping(value = "/cateNameCheck.do")
	public HashMap<String, Object> cateNameCheck(String cateName){
		logger.info("받아온 이름 : "+cateName);
		boolean cateCheck = true;
		cateCheck = service.cateNameCheck(cateName);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("cateCheck", cateCheck);
		return result;
	}
	
	/* 카테고리 수정 */
	@GetMapping(value = "/itemCateUpdate.do")
	public HashMap<String, Object> itemCateUpdate(int itIdx, String cateName) {
		return service.itemCateUpdate(itIdx, cateName);
	}
	
	/* 비품 목록 이동 */
	@GetMapping(value = "/thingManage")
	public ModelAndView thingManage() {
		ModelAndView mav = new ModelAndView("item/thingManage");
		return mav;
	}
	
	/* 비품 관리 대장 */
	@GetMapping(value = "/getThingManageList.do")
	public HashMap<String, Object> getThingManageList(int page){
		logger.info("비품관리대장 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.getThingManageList(page);
	}
	
	/* 비품 검색 리스트 */
	@GetMapping(value = "/getThingManageSearch.do")
	public HashMap<String, Object> getThingManageSearch(@RequestParam HashMap<String, String> params){
		logger.info(params.get("비품목록 검색 "+"page")+"페이지 검색결과(ajax) 데이터 요청");
		return service.getThingManageSearch(params);
	}
	
	
}
