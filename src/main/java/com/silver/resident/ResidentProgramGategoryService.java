package com.silver.resident;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ResidentProgramGategoryService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentProgramGategoryDAO residentprogramgategorydao;

	//프로그램카테고리 리스트
	public ArrayList<ResidentProgramGategoryDTO> list() {
		
		logger.info("서비스 start");
		return residentprogramgategorydao.list();
	}

	//프로그램카테고리 상세보기 페이지이동
	public ModelAndView CategoryUpdateDetail(String pc_idx) {
		
		ModelAndView mav =new ModelAndView("resident/categoryUpdate");
		ResidentProgramGategoryDTO dto=residentprogramgategorydao.detailCall(pc_idx);
		logger.info("idx확인:"+pc_idx);
		mav.addObject("list",dto);
		
		return mav;
	}
	//프로그램카테고리 수정
	public ModelAndView CategoryUpdateComplete(HttpServletRequest req) {
		
		String pc_idx=req.getParameter("pc_idx");
		String pc_cate=req.getParameter("pc_cate");
		
		logger.info("카테고리 수정완료:"+pc_idx);
		logger.info("카테고리 수정완료:"+pc_cate);
		
		residentprogramgategorydao.CategoryUpdateComplete(pc_idx,pc_cate);
		ModelAndView mav = new ModelAndView("resident/residentProgramGategory");
		
		return mav;
	}
	//프로그램카테고리 작성
	public ModelAndView CategoryWriteComplete(HttpServletRequest req, int pc_idx, String pc_cate) {
		logger.info("서비스 시작");
		ResidentProgramGategoryDTO dto=new ResidentProgramGategoryDTO();
		dto.setPc_idx(pc_idx);
		dto.setPc_cate(pc_cate);
		int row = residentprogramgategorydao.CategoryWriteComplete(dto);
		logger.info("서비스 중간");
		ModelAndView mav = new ModelAndView("resident/residentProgramGategory");
		logger.info("서비스 끝");
		return mav;
	}



}
