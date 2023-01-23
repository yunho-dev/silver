package com.silver.item;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CarController {
	
	private final CarService service;
	
	public CarController(CarService service) {
		this.service = service;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	/* 차량으로 이동 */
	@GetMapping(value = "/car")
	public ModelAndView car(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("item/car");
		logger.info("이동 params:{}",params);
		mav.addObject("page", params);
		return mav;
	}
	
	@GetMapping(value = "/getCarList.do")
	public HashMap<String, Object> getCarList(){
		logger.info("차량 리스트 조회 접근");
		return service.getCarList();
	}
	
	/* 차량 운행 기록 조회 */
	@GetMapping(value = "/getDriveHistory.do")
	public HashMap<String, Object> getDriveHistory(int carIdx, String carNum, int page){
		logger.info(carIdx+"번 차량({}) {}페이지 운행 기록 조회 접근", carNum, page);
		return service.getDriveHistory(carIdx, page);
	}
	
	/* 차량 예약 기록 조회 */
	@GetMapping(value = "/getCarBookList.do")
	public HashMap<String, Object> getCarBookList(int carIdx, String carNum, int page){
		logger.info(carIdx+"번 차량({}) 예약기록 조회 접근", carNum);
		return service.getCarBookList(carIdx, page);
	}
	
	/* 차량 운행 등록 */
	@PostMapping(value = "/carHistoryResist.do")
	public HashMap<String, Object> carHistoryResist(@RequestParam HashMap<String, String> params){
		logger.info(params.get("carIdx")+"번 차량({}) 운행 등록 접근", params.get("carNum"));
		return service.carHistoryResist(params);
	}
	
	/* 차량 정보 등록 */
	@PostMapping(value = "/carResist.do")
	public HashMap<String, Object> carResist(@RequestParam HashMap<String, String> params){
		logger.info("차량 정보 등록 접근");
		return service.carResist(params);
	}
	
	/* 차량 수정 버튼 눌렀을 때 가져오는 정보 */
	@GetMapping(value = "/getCarInfo.do")
	public HashMap<String, Object> getCarInfo(int carIdx, String carNum){
		logger.info(carIdx+"번 차량({}) 차량 정보 수정 버튼 눌림(수정할 데이터 보내줌)", carNum);
		return service.getCarInfo(carIdx);
	}
	
	/* 차량 수정 */
	@PostMapping(value = "/carModify.do")
	public HashMap<String, Object> carModify(@RequestParam HashMap<String, String> params){
		logger.info(params.get("carIdx")+"번 차량({}) 수정 접근", params.get("oldCarNum"));
		return service.carModify(params);
	}
	
	/* 차량 운행 기록 수정 버튼 눌렀을 때 가져오는 정보 */
	@GetMapping(value = "/getDriveHistoryModifyInfo.do")
	public HashMap<String, Object> getDriveHistoryModifyInfo(int chisIdx, String carNum){
		logger.info(carNum+" 차량의 {}번 운행 기록 수정 버튼 눌림(수정할 데이터 보내줌)", chisIdx);
		return service.getDriveHistoryModifyInfo(chisIdx);
	}
	
	@PostMapping(value = "/carHistoryModify.do")
	public HashMap<String, Object> carHistoryModify(@RequestParam HashMap<String, String> params){
		logger.info(params.get("carNum")+"차량의 {}번 운행 기록 수정 접근", params.get("chisIdx"));
		return service.carHistoryModify(params);
	}
	
	/* 차량 예약 등록 */
	@PostMapping(value = "/carBookResist.do")
	public HashMap<String, Object> carBookResist(@RequestParam HashMap<String, String> params, HttpServletRequest request){
		logger.info(params.get("carIdx")+"번 차량({}) 운행 등록 접근", params.get("carNum"));
		return service.carBookResist(params, request);
	}
	
	/* 비품 예약 실시간 날짜 체크 */
	@GetMapping(value = "/carBookRealTimeCheck.do")
	public HashMap<String, Object> carBookRealTimeCheck(@RequestParam HashMap<String, String> params) {
		return service.carBookRealTimeCheck(params);
	}
	
	/* 차량 예약 상세보기 */
	@GetMapping(value = "/getCarBookDetail.do")
	public HashMap<String, Object> getCarBookDetail(int cbIdx, String carNum){
		logger.info(carNum+"차량의 {}번 예약 상세보기 접근", cbIdx);
		return service.getCarBookDetail(cbIdx);
	}
}
