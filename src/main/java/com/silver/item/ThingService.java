package com.silver.item;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ThingService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ThingDAO dao;
		
	public ThingService(ThingDAO dao) {
		this.dao = dao;
	}

	public HashMap<String, Object> getThingList(int page) {
		logger.info("비품 목록을 가져옵니다.");
		HashMap<String, Object> result=new HashMap<String, Object>();
		ArrayList<ThingDTO> thingList = dao.getThingList();
		logger.info("가져온 데이터 : {}", thingList);
		result.put("list", thingList);
		return result;
	}

	public HashMap<String, Object> getThingListSearch(HashMap<String, String> params) {
		logger.info("비품 검색 기능 접근");
		ArrayList<ThingDTO> thingList = dao.getThingListSearch(params);
		logger.info("가져온 데이터 : {}", thingList);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", thingList);
		return result;
	}

	public HashMap<String, Object> getThingDetail(String thIdx) {
		ThingDTO dto = dao.getThingDetail(thIdx);
		logger.info("가져온 데이터 : {}", dto);
		ThingDTO photoDto = dao.photoView(thIdx);
		logger.info("사진데이터 : {}", photoDto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		result.put("detailPhoto", photoDto);
		return result;
	}
	
	@Transactional
	public HashMap<String, Object> thingWrite(MultipartFile thPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		ThingDTO dto = new ThingDTO();
		Date thDate = Date.valueOf(params.get("thDate"));
		dto.setIt_idx(Integer.parseInt(params.get("thCateReal")));
		dto.setTh_name(params.get("thName"));
		dto.setTh_part(params.get("thPart"));
		dto.setTh_date(thDate);
		dto.setTh_model(params.get("thModel"));
		dto.setTh_money(Integer.parseInt(params.get("thMoney")));
		dto.setTh_spon(params.get("thSpon"));
		
		int row = dao.thingWrite(dto);
		int thIdx = dto.getTh_idx();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("insert한 thIdx : "+thIdx);
		
		if(thPhoto != null){
			String oriFileName = thPhoto.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = fileSave(thPhoto,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("")) {
					dao.photoInsert(oriFileName, newFileName, thIdx);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("thIdx", thIdx);
		return result;
	}
	
	/**
	 * 파일 객체와 확장자를 넣으면 파일 저장 후 저장된 파일명을 반환
	 * @param photo 파일 객체
	 * @param ext 확장자명
	 * @return 저장한 파일명
	 */
	private String fileSave(MultipartFile photo, String ext) {
		logger.info("파일 저장 기능 접근");
		// 1. 새 파일명 생성
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("서버에 저장될 파일명이 생성되었습니다. 파일명 : "+newFileName);
		
		// 2. 저장
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/filephoto/"+newFileName);
			logger.info("저장될 파일 경로 : {}", path);
			Files.write(path, bytes);
			logger.info("파일 저장 완료");
		} catch (IOException e) {
			logger.info("파일 저장 실패! 저장될 파일 이름을 초기화합니다.");
			newFileName = "";
			e.toString();
		}
		
		// 3. 새 파일 명 반환
		return newFileName;
	}

	public ModelAndView itemCateList() {
		ModelAndView mav = new ModelAndView("item/itemCateList");
		ArrayList<HashMap<String, Object>> list = dao.itemCateList();
		logger.info("카테고리 list : {} ",list);
		mav.addObject("list", list);
		return mav;
	}

	public boolean thingCheck(String thName) {
		String thingCheck = dao.thingCheck(thName);
		return thingCheck == null? false : true;
	}
	
	
}
