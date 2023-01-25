package com.silver.resident;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ResidentService {

	@Autowired ResidentDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
		
	public ModelAndView resident(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("resident/resident");
		ArrayList<ResidentDTO> resident = dao.resident();
		logger.info("resident size: "+resident.size());		
		mav.addObject("resident", resident);
		
		HashMap<String, String> map = new HashMap<String, String>();		
		map.put("page", "resident");		
		logger.info("이동 params:{}",params);
		mav.addObject("page", map);
		
		
		return mav;
	}
	public ModelAndView residentCategory(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("resident/residentCategory");
		ArrayList<ResidentDTO> resident = dao.resident();
		logger.info("resident size: "+resident.size());
		mav.addObject("resident", resident);
		
		HashMap<String, String> map = new HashMap<String, String>();		
		map.put("page", "resident");		
		logger.info("이동 params:{}",params);
		mav.addObject("page", map);
		return mav;
	}
	
	
	public ModelAndView residentsearch(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("resident/resident");
		ArrayList<ResidentDTO> resident = dao.residentsearch(params);
		logger.info("resident size: "+resident.size());
		mav.addObject("resident", resident);
		return mav;
	}
	public ModelAndView residentCateSearch(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("resident/residentCategory");
		ArrayList<ResidentDTO> residentCateSearch = dao.residentCateSearch(params);
		logger.info("residentCateSearch size: "+residentCateSearch.size());
		mav.addObject("resident", residentCateSearch);
		return mav;
	}
	

	@Transactional
	public void residentdetail(String re_idx, Model model, String string) {
		logger.info("residentdetail");
		ResidentDTO rd = dao.residentdetail(re_idx);
		ArrayList<ResidentFileDTO> rdfile = dao.residentFiledetail(re_idx);
		model.addAttribute("rd", rd);
		model.addAttribute("rdfile", rdfile);
	}
	@Transactional
	public HashMap<String, Object> residentDetail(String re_idx) {
		logger.info("residentdetail");
		HashMap<String, Object> result = new HashMap<String, Object>();
		ResidentDTO rd=dao.residentDetail(re_idx);
		ArrayList<ResidentFileDTO> rdfile = dao.residentFiledetail(re_idx);
		result.put("rd", rd);
		result.put("rdfile", rdfile);
		return result;
	}
	@Transactional
	public HashMap<String, Object> roomListCall() {
		logger.info("roomListCall");
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ResidentFileDTO> roomListCall = dao.roomListCall();
		result.put("rd", roomListCall);
		return result;
	}
	/*
	@Transactional
	public void cateDetailDetail(String re_idx, Model model, String string) {
		logger.info("cateDetailDetail");
		ResidentDTO rd = dao.cateDetailDetail(re_idx);
		model.addAttribute("rd", rd);
	}
	*/
//	@Transactional
//	public void residentCateDetail(String re_idx, Model model, String string) {
//		logger.info("residentCateDetail");
//		ResidentDTO rd = dao.residentCateDetail(re_idx);
//		model.addAttribute("rd", rd);
//	}
	/*
	@Transactional
	public ModelAndView residentCateDetail(String re_idx) {
		ModelAndView mav = new ModelAndView("resident/residentCateDetail");
		ArrayList<ResidentDTO> residentCateDetail = dao.residentCateDetail(re_idx);
		logger.info("residentCateDetail size: "+residentCateDetail.size());
		mav.addObject("residentCateDetail", residentCateDetail);
		return mav;
	}
	*/
	public HashMap<String, Object> residentCateDetail(String re_idx) {
		
		logger.info("입소자 관리 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ResidentDTO> cateDetailList=dao.residentCateDetail(re_idx);
		//logger.info("입소자 관리 리스트:{}",cateDetailList);
		/*
		for (int i = 0; i < cateDetailList.size(); i++) {
			ResidentDTO dto = cateDetailList.get(i);			
		}
		*/
		
		for(ResidentDTO dto : cateDetailList) {
			logger.info(dto.getCo_start()+"~"+dto.getCo_end());
			
			
			
		}
		
		
		
		
		result.put("list", cateDetailList);
		return result;
	}
public HashMap<String, Object> residentDateSearch(HashMap<String, String> params) {
		
	logger.info("입소자 관리 목록을 가져오는 서비스");
	HashMap<String, Object> result = new HashMap<String, Object>();
	ArrayList<ResidentDTO> residentDateSearch=dao.residentDateSearch(params);
	logger.info("입소자 관리 리스트:{}"+residentDateSearch);
	result.put("list", residentDateSearch);
	return result;
	}
	
	
	
	public String residentwrite(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, HashMap<String, String> params) {
		logger.info("photo_fp_oriFileName 이름 : "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		logger.info("받아온 요소 : {}", params);
		
		int success=dao.residentwrite(params);
		String re_idx = params.get("re_idx");
		logger.info("re_idx: "+re_idx);			
		logger.info("success: "+success);

		// 성공하고, 업로드 할 photo이 있다면... 	
		try {
			if(success >0 && !photo_fp_oriFileName.getOriginalFilename().equals("")) {
				//파일을 업로드 하고, photo 에 데이터 넣기	
				logger.info("사진 넣기 시작");
				residentphotoInsert(photo_fp_oriFileName, re_idx);
			}
		} catch (Exception e) {
		}
		// 성공하고, 업로드 할 파일이 있다면... 	
		try {
			if(success >0 && fp_oriFileName != null) {
				//파일을 업로드 하고, photo 에 데이터 넣기	
				logger.info("파일 넣기 시작");
				residentmultiInsert(fp_oriFileName, re_idx);
			}
		} catch (Exception e) {
		}
				
		logger.info("residentwrite 끝");
		return "redirect:/resident";				
		}
	
	public String residentwriteCure(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);	
		
		// 현재 날짜 구하기
        LocalDate now =  LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd ");
        // 포맷 적용        
        String date = now.format(formatter);
         logger.info("date: "+date);
                  
		String starttime = params.get("co_start"); 
		String starttime2 = starttime+":00.000";
		String starttime3= date+starttime2;
		/*
		 * java.sql.Timestamp startdatetime = java.sql.Timestamp.valueOf(starttime3);
		 * logger.info("startdatetime: "+startdatetime);
		 */		
		String endtime = params.get("co_end"); 
		String endtime2 = endtime+":00.000";
		String endtime3= date+endtime2;
		/*
		 * java.sql.Timestamp enddatetime = java.sql.Timestamp.valueOf(endtime3);
		 * logger.info("enddatetime: "+enddatetime);
		 */
		
		ResidentDTO dto = new ResidentDTO();		
		int re_idx =  Integer.parseInt(params.get("re_idx"));
		dto.setRe_idx(re_idx);
		dto.setCc_idx(1);
		dto.setCo_write(params.get("co_write"));
		dto.setCo_start(starttime3);
		dto.setCo_end(endtime3);
		dto.setCu_content(params.get("cu_content"));
		dto.setCo_event(params.get("co_event"));
		
		int success=dao.residentwriteCure(dto);
				
		logger.info("success: "+success);
		return "redirect:/residentCategory";			
	}
	public String residentwriteMedic(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);	
		
		// 현재 날짜 구하기
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd ");
        // 포맷 적용        
        String date = now.format(formatter);
         logger.info("date: "+date);
                  
		String starttime = params.get("me_start"); 
		String starttime2 = starttime+":00.000";
		String starttime3= date+starttime2;
		java.sql.Timestamp startdatetime = java.sql.Timestamp.valueOf(starttime3);
		logger.info("startdatetime: "+startdatetime);
		
		String endtime = params.get("me_end"); 
		String endtime2 = endtime+":00.000";
		String endtime3= date+endtime2;
		java.sql.Timestamp enddatetime = java.sql.Timestamp.valueOf(endtime3);
		logger.info("enddatetime: "+enddatetime);
		
		ResidentDTO dto = new ResidentDTO();		
		int re_idx =  Integer.parseInt(params.get("re_idx"));
		dto.setRe_idx(re_idx);
		dto.setCc_idx(2);
		dto.setMe_write(params.get("me_write"));
		dto.setMe_start(startdatetime);
		dto.setMe_end(enddatetime);
		dto.setMe_name(params.get("me_name"));
		dto.setMe_volume(params.get("me_volume"));
		dto.setMe_way(params.get("me_way"));
		dto.setMe_event(params.get("me_event"));
		
		int success=dao.residentwriteMedic(dto);
				
		logger.info("success: "+success);
		return "redirect:/residentCategory";				
	}
	public String residentwriteVital(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);	
		
		// 현재 날짜 구하기
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd ");
        // 포맷 적용        
        String date = now.format(formatter);
         logger.info("date: "+date);
                  
		String starttime = params.get("vi_start"); 
		String starttime2 = starttime+":00.000";
		String starttime3= date+starttime2;
		java.sql.Timestamp startdatetime = java.sql.Timestamp.valueOf(starttime3);
		logger.info("startdatetime: "+startdatetime);
		
		String endtime = params.get("vi_end"); 
		String endtime2 = endtime+":00.000";
		String endtime3= date+endtime2;
		java.sql.Timestamp enddatetime = java.sql.Timestamp.valueOf(endtime3);
		logger.info("enddatetime: "+enddatetime);
		
		ResidentDTO dto = new ResidentDTO();		
		int re_idx =  Integer.parseInt(params.get("re_idx"));
		int vi_blood =  Integer.parseInt(params.get("vi_blood"));
		int vi_heart =  Integer.parseInt(params.get("vi_heart"));
		double vi_temp =  Integer.parseInt(params.get("vi_temp"));
		int vi_breath =  Integer.parseInt(params.get("vi_breath"));
		int vi_sugar =  Integer.parseInt(params.get("vi_sugar"));
		double vi_weight =  Integer.parseInt(params.get("vi_weight"));
		dto.setRe_idx(re_idx);
		dto.setVi_blood(vi_blood);
		dto.setVi_heart(vi_heart);
		dto.setVi_temp(vi_temp);
		dto.setVi_breath(vi_breath);
		dto.setVi_sugar(vi_sugar);
		dto.setVi_weight(vi_weight);
		dto.setCc_idx(3);
		dto.setVi_write(params.get("vi_write"));
		dto.setVi_start(startdatetime);
		dto.setVi_end(enddatetime);
		dto.setVi_event(params.get("vi_event"));
		
		int success=dao.residentwriteVital(dto);
				
		logger.info("success: "+success);
		return "redirect:/residentCategory";				
	}
	public void cateDetailCure(int re_idx,int cu_num, Model model, String string) {
		logger.info("re_idx: "+re_idx);	
		logger.info("cu_num: "+cu_num);
		ResidentDTO rd = dao.cateDetailCure(re_idx,cu_num);
		model.addAttribute("rd", rd);		
	}
	public void cateDetaiMedic(int re_idx, int me_num, Model model, String string) {
		logger.info("re_idx: "+re_idx);	
		logger.info("me_num: "+me_num);
		ResidentDTO rd = dao.cateDetailMedic(re_idx,me_num);
		model.addAttribute("rd", rd);			
	}
	public void cateDetailVital(int re_idx, int vi_num, Model model, String string) {
		logger.info("re_idx: "+re_idx);	
		logger.info("vi_num: "+vi_num);
		ResidentDTO rd = dao.cateDetailVital(re_idx,vi_num);
		model.addAttribute("rd", rd);		
	}
	
	
	
	// 입소자 사진 업로드
	public void residentphotoInsert(MultipartFile photo_fp_oriFileName, String re_idx) {
		// 1. 파일명 추출
		String photooriFileName = photo_fp_oriFileName.getOriginalFilename();
		String photoext = photooriFileName.substring(photooriFileName.lastIndexOf(".")); // 1-1. 확장자 잘라내기
		String photonewFileName = System.currentTimeMillis()+photoext; // 1-2. 신규 파일명 생성
		logger.info("첨부된 사진이 있습니다. 사진 명 : "+photooriFileName);
		logger.info("newFileName: "+photonewFileName);
		
		try {
			byte[] bytes = photo_fp_oriFileName.getBytes(); //2-1. 파일 바이너리 얻어내기
			//2-2. 특정경로에 파일 쓰기
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/filephoto/"+photonewFileName);
			Files.write(path, bytes);
			logger.info(photonewFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentphotoInsert(re_idx,photooriFileName, photonewFileName);
		} catch (IOException e) {
		} 
	}
	// 다중 첨부파일 업로드
	private void residentmultiInsert(MultipartFile[] fp_oriFileName, String re_idx) {
		logger.info("residentmultiInsert1");
		for(MultipartFile file: fp_oriFileName) {
			try {
				residentfileInsert(file, re_idx);
				logger.info("residentmultiInsert2");
				Thread.sleep(1);
			} catch (InterruptedException e) {
			}
		}	
	}
	public void residentfileInsert(MultipartFile fp_oriFileName, String re_idx) {
		// 1. 파일명 추출
		logger.info("residentmultiInsert3");
		String oriFileName = fp_oriFileName.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 1-1. 확장자 잘라내기
		String newFileName = System.currentTimeMillis()+ext; // 1-2. 신규 파일명 생성
		logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
		logger.info("newFileName: "+newFileName);
		
		try {
			byte[] bytes = fp_oriFileName.getBytes(); //2-1. 파일 바이너리 얻어내기
			//2-2. 특정경로에 파일 쓰기
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/filephoto/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentfileInsert(re_idx,oriFileName, newFileName);
		} catch (IOException e) {
		} 
	}	

	
	public String residentupdate(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, HashMap<String, String> params) {
		logger.info("photo_fp_oriFileName 이름 : "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		logger.info("받아온 요소 : {}", params);
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		
		int success=dao.residentupdate(params);
		String re_idx = params.get("re_idx");
		logger.info("re_idx: "+re_idx);	
		
		logger.info("success: "+success);
		
		// 성공하고, 업로드 할 파일이 있다면... 	
		try {
			if(success >0 && !photo_fp_oriFileName.getOriginalFilename().equals("")) {
				//파일을 업로드 하고, photo 에 데이터 넣기	
				logger.info("사진 넣기 시작");
				residentphotoUpload(photo_fp_oriFileName, re_idx);
			}
		} catch (Exception e) {
		}

		// 성공하고, 업로드 할 파일이 있다면... 	
		try {
			if(success >0 && fp_oriFileName != null) {
				//파일을 업로드 하고, photo 에 데이터 넣기	
				logger.info("파일 넣기 시작");
				residentmultiUpload(fp_oriFileName, re_idx);
			}
		} catch (Exception e) {
		}
				
		logger.info("residentwrite 끝");
		return "redirect:/resident";				
	}
	public String cateUpdateCure(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		logger.info("residentupdate cu_num: "+params.get("cu_num"));
		
		
		int success=dao.cateUpdateCure(params);		
		logger.info("success: "+success);
		return "redirect:/residentCategory";
		
	}
	public String cateUpdateMedic(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		logger.info("residentupdate me_num: "+params.get("me_num"));
		
		int success=dao.cateUpdateMedic(params);
		logger.info("success: "+success);
		return "redirect:/residentCategory";
		
	}
	public String cateUpdateVital(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		logger.info("residentupdate vi_num: "+params.get("vi_num"));

			int success=dao.cateUpdateVital(params);			
			logger.info("success: "+success);
		
		return "redirect:/residentCategory";
		
	}
	// 입소자 사진 업로드
	public void residentphotoUpload(MultipartFile photo_fp_oriFileName, String re_idx) {
		// 1. 파일명 추출
		String photooriFileName = photo_fp_oriFileName.getOriginalFilename();
		String photoext = photooriFileName.substring(photooriFileName.lastIndexOf(".")); // 1-1. 확장자 잘라내기
		String photonewFileName = System.currentTimeMillis()+photoext; // 1-2. 신규 파일명 생성
		logger.info("첨부된 사진이 있습니다. 사진 명 : "+photooriFileName);
		logger.info("newFileName: "+photonewFileName);
		
		try {
			byte[] bytes = photo_fp_oriFileName.getBytes(); //2-1. 파일 바이너리 얻어내기
			//2-2. 특정경로에 파일 쓰기
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/filephoto/"+photonewFileName);
			Files.write(path, bytes);
			logger.info(photonewFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentphotoUpload(re_idx,photooriFileName, photonewFileName);
		} catch (IOException e) {
		} 
	}
	// 다중 첨부파일 업로드
	private void residentmultiUpload(MultipartFile[] fp_oriFileName, String re_idx) {
		for(MultipartFile file: fp_oriFileName) {
			try {
				residentfileUpload(file, re_idx);
				Thread.sleep(1);
			} catch (InterruptedException e) {
			}
		}	
	}
	public void residentfileUpload(MultipartFile fp_oriFileName, String re_idx) {
		// 1. 파일명 추출
		String oriFileName = fp_oriFileName.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 1-1. 확장자 잘라내기
		String newFileName = System.currentTimeMillis()+ext; // 1-2. 신규 파일명 생성
		logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
		logger.info("newFileName: "+newFileName);
		
		try {
			byte[] bytes = fp_oriFileName.getBytes(); //2-1. 파일 바이너리 얻어내기
			//2-2. 특정경로에 파일 쓰기
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/filephoto/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentfileUpload(re_idx,oriFileName, newFileName);
		} catch (IOException e) {
		} 
	}
	
	









	


}
