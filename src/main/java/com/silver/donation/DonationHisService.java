package com.silver.donation;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;

@Service
public class DonationHisService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DonationHisDAO dao;
	
	public HashMap<String, Object> donHistoryCall(int page) {
		logger.info("후원금 리스트 호출"+page);
		
		int offset = (page-1)*10;
		
		int totalCount = dao.totalCount();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info("총 페이지 수:"+totalPages);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", dao.donHistoryCall(offset));
		
		return result;
	}
	
	public int searchdonationHisTotal(String select, String seacontent) {
		return dao.searchdonationHisTotal(select,seacontent);
	}
	
	
	
	public Object searchHisdonation(String select, String seacontent, int page) {
		ArrayList<DonationHisDTO> list = dao.searchHisdonation(select,seacontent,page);
		return list;
	}
	
	
	public HashMap<String, Object> donWrite(MultipartFile dh_Photo, HashMap<String, String> params) {
		DonationHisDTO dto = new DonationHisDTO();
		Date dhdate = Date.valueOf(params.get("dh_date"));
		dto.setDh_cate(params.get("dh_cate"));
		dto.setDh_goal(params.get("dh_goal"));
		dto.setDh_write(params.get("dh_write"));
		logger.info("머니 params : "+params.get("dh_money"));
		logger.info("머니 params 형 : "+params.get("dh_money").getClass());
		int ChangeDh_money=Integer.parseInt(params.get("dh_money"));
		logger.info("머니 형 변환 값 전 : "+dto.getDh_money());
		dto.setDh_money(ChangeDh_money);
		logger.info("머니 형 변환 값 전 : "+dto.getDh_money());
		
		logger.info("params:{}",params);
		dto.setDh_date(dhdate);
		int row = dao.donWrite(dto);
		int dhidx = dto.getDh_idx();
		logger.info("키 제너 : "+dhidx);
		
		if(dh_Photo != null){
			String oriFileName = dh_Photo.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = fileSave(dh_Photo,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("")) {
					logger.info(oriFileName+" / "+newFileName+" / "+dhidx);
					dao.photoInsert(oriFileName, newFileName, dhidx);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("dh_idx", dhidx);
		return result;
		
	}

	private String fileSave(MultipartFile dh_Photo, String ext) {
		logger.info("파일 저장 기능 접근");
		// 1. 새 파일명 생성
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("서버에 저장될 파일명이 생성되었습니다. 파일명 : "+newFileName);
		
		// 2. 저장
		try {
			byte[] bytes = dh_Photo.getBytes();
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/filephoto/"+newFileName);
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

	public ModelAndView donHisUpdateForm(int dh_idx, HashMap<String, String> params) {
		logger.info("이동확인");
		DonationHisDTO dto = dao.donHisUpdateForm(dh_idx);
		String donHisUpdateForm_File=dao.donHisUpdateForm_File(dh_idx);
		ModelAndView mav = new ModelAndView("donation/donHisUpdateForm");
		mav.addObject("donhistory",dto);
		mav.addObject("photoinfo",donHisUpdateForm_File);
		return mav;
	}

	public HashMap<String, Object> donHisUpdate(MultipartFile dh_Photo,HashMap<String, String> params) {
		DonationHisDTO dto = new DonationHisDTO();
		Date dhdate = Date.valueOf(params.get("dh_date"));
		logger.info("서비스 이동확인");
		logger.info("params:{}",params);
		dto.setDh_cate(params.get("dh_cate"));
		dto.setDh_goal(params.get("dh_goal"));
		dto.setDh_write(params.get("dh_write"));
		int dh_idx = Integer.parseInt(params.get("dh_idx"));
		dto.setDh_idx(dh_idx);
		
		logger.info(params.get("dh_idx"));
		logger.info("머니 params : "+params.get("dh_money"));
		logger.info("머니 params 형 : "+params.get("dh_money").getClass()); 
		int ChangeDh_money=Integer.parseInt(params.get("dh_money"));
		logger.info("머니 형 변환 값 전 : "+dto.getDh_money());
		dto.setDh_money(ChangeDh_money);
		logger.info("머니 형 변환 값 전 : "+dto.getDh_money());
		 
		dto.setDh_date(dhdate);
		
		int row = dao.donHisUpdate(dto);
		logger.info("영향받은 행:"+row);
		int dhidx = dto.getDh_idx();
		logger.info("dhidx 값 :"+dhidx);
		logger.info("dh_photo : "+dh_Photo);
		logger.info("dh_photo : "+dh_Photo.getOriginalFilename());
		logger.info("dh_photo : "+dh_Photo.getOriginalFilename().getClass());
		if (!dh_Photo.isEmpty()) {
			logger.info("dh_Photo 빈값 아님");
		}else {
			logger.info("dh_Photo 빈값");
		}
		if(dh_Photo != null){
			logger.info("IF 문 들어옴");
			DonationHisDTO photofind = dao.findphoto(dhidx);
			String oriFileName = dh_Photo.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = fileSave(dh_Photo,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("") && photofind != null ) {
					dao.photoUpdate(oriFileName, newFileName, dhidx);
				}else if(!newFileName.equals("") && photofind == null) {
					dao.photoInsert(oriFileName, newFileName, dhidx);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("dh_idx", dhidx);
		return result;
		
	}



	

}
