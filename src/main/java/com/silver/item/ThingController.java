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
	public ModelAndView thingList(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/thingList");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
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
		logger.info("비품 목록 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
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
	public ModelAndView itemCate(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/itemCateList");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
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
	public ModelAndView itemCateWrite(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/itemCateWrite");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
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
	
	/* 비품 관리 대장으로 이동 */
	@GetMapping(value = "/thingManage")
	public ModelAndView thingManage(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/thingManage");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
		return mav;
	}
	
	/* 비품 관리 대장 */
	@GetMapping(value = "/getThingManageList.do")
	public HashMap<String, Object> getThingManageList(int page){
		logger.info("비품관리대장 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.getThingManageList(page);
	}
	
	/* 비품 관리대장 검색 */
	@GetMapping(value = "/getThingManageSearch.do")
	public HashMap<String, Object> getThingManageSearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 관리대장 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		return service.getThingManageSearch(params);
	}
	
	/* 비품 사용내역으로 이동 */
	@GetMapping(value = "/thingHistory")
	public ModelAndView thingHistory(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/thingHistory");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
		return mav;
	}
	
	@GetMapping(value = "/getThingHistoryList.do")
	public HashMap<String, Object> getThingHistoryList(int page){
		logger.info("비품사용내역 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.getThingHistoryList(page);
	}
	
	@GetMapping(value = "/getThingHistorySearch.do")
	public HashMap<String, Object> getThingHistorySearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 사용내역 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		return service.getThingHistorySearch(params);
	}
	
	/* 비품 사용내역 등록 */
	@PostMapping(value = "/thingHistoryWrite.do")
	public HashMap<String, Object> thingHistoryWrite(@RequestParam HashMap<String, String> params, HttpServletRequest request) {
		return service.thingHistoryWrite(params, request);
	}
	
	/* 비품 사용내역 조회 - 등록 - 비품목록 */
	@GetMapping(value = "/popThingHistoryList.go")
	public ModelAndView popThingHistoryList(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/popThingHistoryList");
		return mav;
	}
	
	@GetMapping(value = "/getPopThHisSearch.do")
	public HashMap<String, Object> getPopThHisSearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 사용내역(팝업) "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		params.put("thModel", "");
		params.put("hisName", "");
		params.put("checkAllView", "");
		return service.getThingHistorySearch(params);
	}
	
	/* 비품 사용내역 상세보기 */
	@GetMapping(value = "/getThingHistoryDetail.do")
	public HashMap<String, Object> getThingHistoryDetail(String hisIdx){
		logger.info(hisIdx+"번째 비품에 대한 사용내역 상세보기 or 수정할 데이터 요청");
		return service.getThingHistoryDetail(hisIdx);
	}
	
	/* 비품 사용내역 수정하기 */
	@PostMapping(value = "/updateThingHistory.do")
	public HashMap<String, Object> getThingHistoryUpdate(@RequestParam HashMap<String, Object> params, HttpServletRequest request){
		logger.info("비품 사용내역 수정 접근");
		return service.updateThingHistory(params, request);
	}
	
	/* 비품 사용예약으로 이동 */
	@GetMapping(value = "/thingBook.go")
	public ModelAndView thingBook(@RequestParam HashMap<String, String> params) {
		logger.info("비품 사용 예약으로 이동 요청");
		ModelAndView mav = new ModelAndView("item/thingBook");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
		return mav;
	}
	
	/* 비품 예약 조회 리스트 */
	@GetMapping(value = "/getThingBook.do")
	public HashMap<String, Object> getThingBook(int page){
		logger.info("비품예약 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.getThingBook(page);
	}
	
	/* 비품 예약 검색 */
	@GetMapping(value = "/getThingBookSearch.do")
	public HashMap<String, Object> getThingBookSearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 사용내역 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		return service.getThingBookSearch(params);
	}
	
	/* 비품 예약 -> 사용자 -> 입소자 리스트 */
	@GetMapping(value = "/thingResidentList.go")
	public ModelAndView thingResidentList(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/thingResidentList");
		return mav;
	}
	/* 입소자 리스트 조회 */
	@GetMapping(value = "/thingResidentList.do")
	public HashMap<String, Object> thingResidentList(int page){
		logger.info("비품 예약 등록 - 입소자 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.thingResidentList(page);
	}
	/* 입소자 검색 */
	@GetMapping(value = "/getThResiSearch.do")
	public HashMap<String, Object> getThResiSearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 예약 등록 - 입소자 검색 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		return service.getThResiSearch(params);
	}
	
	/* 비품 예약 -> 사용자 -> 직원 리스트 */
	@GetMapping(value = "/thingMemberList.go")
	public ModelAndView thingMemberList(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/thingMemberList");
		return mav;
	}
	/* 직원 리스트 조회 */
	@GetMapping(value = "/thingMemberList.do")
	public HashMap<String, Object> thingMemberList(int page){
		logger.info("비품 예약 등록 - 직원 "+page+"페이지 리스트(ajax) 데이터 요청");
		return service.thingMemberList(page);
	}
	/* 직원 검색 */
	@GetMapping(value = "/getThMemberSearch.do")
	public HashMap<String, Object> getThMemberSearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 예약 등록 - 직원 검색 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		return service.getThMemberSearch(params);
	}
	/* 비품 예약 -> 품명 */
	@GetMapping(value = "/popThList.go")
	public ModelAndView popThList(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/popThList");
		return mav;
	}
	
	/* 비품검색 */
	@GetMapping(value = "/getPopThSearch.do")
	public HashMap<String, Object> getPopThSearch(@RequestParam HashMap<String, String> params){
		logger.info("비품 예약 등록 - 비품 검색 "+params.get("page")+"페이지 검색(ajax) 데이터 요청");
		return service.getPopThSearch(params);
	}
	
	/* 비품 예약 등록 */
	@PostMapping(value = "/thingBookWrite.do")
	public HashMap<String, Object> thingBookWrite(@RequestParam HashMap<String, String> params, HttpServletRequest request) {
		return service.thingBookWrite(params, request);
	}
	
	/* 비품 예약 실시간 날짜 체크 */
	@GetMapping(value = "/thingBookRealTimeCheck.do")
	public HashMap<String, Object> thingBookRealTimeCheck(@RequestParam HashMap<String, String> params) {
		return service.thingBookRealTimeCheck(params);
	}
	
	/* 비품 예약 상세보기 */
	@GetMapping(value = "/getThingBookDetail.do")
	public HashMap<String, Object> getThingBookDetail(String cbIdx){
		logger.info(cbIdx+"번째 예약에 대한 사용내역 상세보기");
		return service.getThingBookDetail(cbIdx);
	}
	
	@PostMapping(value = "/bookCancel.do")
	public HashMap<String, Object> thingBookCancel(int cbIdx, String bContent, HttpServletRequest request){
		logger.info("비품 수정 접근");
		return service.thingBookCancel(cbIdx, bContent, request);
	}
	
}
