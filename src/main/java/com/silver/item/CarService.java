package com.silver.item;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class CarService {
	
	private final CarDAO dao;
	
	public CarService(CarDAO dao) {
		this.dao = dao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public HashMap<String, Object> getCarList() {
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("리스트를 조회를 시도합니다");
		ArrayList<CarDTO> list = dao.carList();
		logger.info("리스트를 조회했습니다.");
		result.put("list", list);
		return result;
	}

	public HashMap<String, Object> getDriveHistory(int carIdx, int page) {
		/* 페이징 계산 */
		//3개씩만 보여줌
		int offset = 3*(page-1);
		int totalCount = dao.totalCountDriveHistory(carIdx);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%3>0 ? (totalCount/3)+1 : (totalCount/3);//총 페이지 수 = 게시물 총 갯수 / 페이지당 보여줄 수 (나누기) 
		logger.info("총 페이지 수 : "+totalPages);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ThingDTO> list = dao.getDriveHistory(carIdx, offset);
		if(totalPages==0) {
			totalPages = 1;
		}
		result.put("list", list);
		result.put("total", totalPages);
		return result;
	}

	public HashMap<String, Object> getCarBookList(int carIdx, int page) {
		/* 페이징 계산 */
		// 5개씩 보여줌
		int offset = 5*(page-1);
		int totalCount = dao.totalCountCarBookList(carIdx);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%5>0 ? (totalCount/5)+1 : (totalCount/5);//총 페이지 수 = 게시물 총 갯수 / 페이지당 보여줄 수 (나누기) 
		logger.info("총 페이지 수 : "+totalPages);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ThingDTO> list = dao.getCarBookList(carIdx, offset);
		if(totalPages==0) {
			totalPages = 1;
		}
		result.put("list", list);
		result.put("total", totalPages);
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
		logger.info("받아온 데이터 : {}", params);
		int row = dao.carModify(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("finish", row);
		return result;
	}

	public HashMap<String, Object> getDriveHistoryModifyInfo(int chisIdx) {
		CarDTO dto = new CarDTO();
		dto = dao.getDriveHistoryModifyInfo(chisIdx);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", dto);
		return result;
	}

	public HashMap<String, Object> carHistoryModify(HashMap<String, String> params) {
		logger.info("받아온 데이터 : {}", params);
		int row = dao.carHistoryModify(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("finish", row);
		return result;
	}

	public HashMap<String, Object> carBookResist(HashMap<String, String> params, HttpServletRequest request) {
		logger.info("받아온 요소 : {}", params);
		
		ThingService thingService = new ThingService(null);
		String bookWriter = thingService.writer(request);
		params.put("bookWriter", bookWriter);
		int check = 0;
		check = dao.carBookCheck(params);
		int row = 0;
		if(check == 0) {
			row = dao.carBookResist(params);
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("finish", row);
		result.put("check", check);
		return result;
	}
	
	public HashMap<String, Object> carBookRealTimeCheck(HashMap<String, String> params) {
		logger.info("차량 예약 실시간 날짜 체크 접근");
		logger.info("받아온 데이터 : {}", params);
		int check = 0;
		check = dao.carBookCheck(params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("check", check);
		return result;
	}

	public HashMap<String, Object> getCarBookDetail(int cbIdx) {
		CarDTO dto = new CarDTO();
		dto = dao.getCarBookDetail(cbIdx);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		return result;
	}

}
