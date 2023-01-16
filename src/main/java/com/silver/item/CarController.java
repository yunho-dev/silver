package com.silver.item;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ModelAndView car() {
		return service.carList();
	}
	
	@GetMapping(value = "/getDriveHistory.do")
	public HashMap<String, Object> getDriveHistory(int carIdx, String carNum){
		logger.info(carIdx+"번 차량({}) 운행 기록 조회", carNum);
		return service.getDriveHistory(carIdx);
	}

}
