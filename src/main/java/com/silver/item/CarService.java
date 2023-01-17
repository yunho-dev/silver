package com.silver.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


@Service
public class CarService {
	
	private final CarDAO dao;
	
	public CarService(CarDAO dao) {
		this.dao = dao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ModelAndView carList() {
		ModelAndView mav = new ModelAndView("item/car");
		ArrayList<CarDTO> list = dao.carList();
		logger.info("가져온 차량 수 : "+list.size());
		
		mav.addObject("list", list);
		
		return mav;
	}

	public HashMap<String, Object> getDriveHistory(int carIdx) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ThingDTO> list = dao.getDriveHistory(carIdx);
		result.put("list", list);
		return result;
	}

	public HashMap<String, Object> getCarBookList(int carIdx) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ThingDTO> list = dao.getCarBookList(carIdx);
		result.put("list", list);
		return result;
	}

	public HashMap<String, Object> carHistoryResist(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		int row = dao.carHistoryResist(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("finish", row);
		return result;
	}

}
