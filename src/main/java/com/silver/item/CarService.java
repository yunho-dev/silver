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

	public HashMap<String, Object> getDriveHistory(int carIdx, int page) {
		/* 페이징 계산 */
		int offset = 10*(page-1);
		int totalCount = dao.totalCountDriveHistory(carIdx);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);//총 페이지 수 = 게시물 총 갯수 / 페이지당 보여줄 수 (나누기) 
		logger.info("총 페이지 수 : "+totalPages);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ThingDTO> list = dao.getDriveHistory(carIdx, offset);
		result.put("list", list);
		result.put("total", totalPages);
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

	public HashMap<String, Object> carResist(HashMap<String, String> params) {
		logger.info("받아온 데이터 : {}", params);
		int row = dao.carResist(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("finish", row);
		return result;
	}

	public HashMap<String, Object> getCarInfo(int carIdx) {
		CarDTO dto = new CarDTO();
		dto = dao.getCarInfo(carIdx);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", dto);
		return result;
	}

	public HashMap<String, Object> carModify(HashMap<String, String> params) {
		int row = dao.carModify(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("finish", row);
		return result;
	}

}
