package com.silver.resident;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
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
		
	public ModelAndView resident() {
		ModelAndView mav = new ModelAndView("resident/resident");
		ArrayList<ResidentDTO> resident = dao.resident();
		logger.info("resident size: "+resident.size());
		mav.addObject("resident", resident);
		return mav;
	}
	public ModelAndView residentCategory() {
		ModelAndView mav = new ModelAndView("resident/residentCategory");
		ArrayList<ResidentDTO> resident = dao.resident();
		logger.info("resident size: "+resident.size());
		mav.addObject("resident", resident);
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
	public void residentCateDetail(String re_idx, Model model, String string) {
		logger.info("residentCateDetail");
		ResidentDTO rd = dao.residentCateDetail(re_idx);
		model.addAttribute("rd", rd);
	}
	
	
	
	public String residentwrite(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, HashMap<String, String> params) {
		logger.info("photo_fp_oriFileName 이름 : "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		logger.info("받아온 요소 : {}", params);
		
		int success=dao.residentwrite(params);
		String re_idx = params.get("re_idx");
		logger.info("re_idx: "+re_idx);	
		
		logger.info("success: "+success);
		logger.info("re_idx: "+re_idx);

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
			Path path = Paths.get("C:/filephoto/"+photonewFileName);
			Files.write(path, bytes);
			logger.info(photonewFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentphotoInsert(re_idx,photooriFileName, photonewFileName);
		} catch (IOException e) {
		} 
	}
	// 다중 첨부파일 업로드
	private void residentmultiInsert(MultipartFile[] fp_oriFileName, String re_idx) {
		for(MultipartFile file: fp_oriFileName) {
			try {
				residentfileInsert(file, re_idx);
				Thread.sleep(1);
			} catch (InterruptedException e) {
			}
		}	
	}
	public void residentfileInsert(MultipartFile fp_oriFileName, String re_idx) {
		// 1. 파일명 추출
		String oriFileName = fp_oriFileName.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 1-1. 확장자 잘라내기
		String newFileName = System.currentTimeMillis()+ext; // 1-2. 신규 파일명 생성
		logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
		logger.info("newFileName: "+newFileName);
		
		try {
			byte[] bytes = fp_oriFileName.getBytes(); //2-1. 파일 바이너리 얻어내기
			//2-2. 특정경로에 파일 쓰기
			Path path = Paths.get("C:/filephoto/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentfileInsert(re_idx,oriFileName, newFileName);
		} catch (IOException e) {
		} 
	}	
	/*
	public String residentupdate(HashMap<String, String> params) {
		
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		logger.info("params:{} ",params);	
		
		dao.residentupdate(params);
		logger.info("params:{} ",params);	
		String re_idx = params.get("re_idx");
		logger.info("params:{} ",params);	
		logger.info("re_idx: "+re_idx);	
		
//		if(success>0 && !photo.getOriginalFilename().equals("")) {
//			fileUpload(photo, idx);
//		}
			
		return "redirect:/residentdetail.go?re_idx="+re_idx;				
		}
	*/	
	public String residentupdate(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, HashMap<String, String> params) {
		logger.info("photo_fp_oriFileName 이름 : "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		logger.info("받아온 요소 : {}", params);
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		
		int success=dao.residentupdate(params);
		String re_idx = params.get("re_idx");
		logger.info("re_idx: "+re_idx);	
		
		logger.info("success: "+success);
		logger.info("re_idx: "+re_idx);
		
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
			Path path = Paths.get("C:/filephoto/"+photonewFileName);
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
			Path path = Paths.get("C:/filephoto/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" UPLOAD OK!");
			//dao 를 이용해서 photo 테이블에 데이터 넣기
			dao.residentfileUpload(re_idx,oriFileName, newFileName);
		} catch (IOException e) {
		} 
	}






	


}
