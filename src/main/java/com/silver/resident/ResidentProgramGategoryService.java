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

	public ArrayList<ResidentProgramGategoryDTO> list() {
		
		logger.info("서비스 start");
		return residentprogramgategorydao.list();
	}

	public ModelAndView CategoryUpdateDetail(String pc_idx) {
		
		ModelAndView mav =new ModelAndView("resident/categoryUpdate");
		ResidentProgramGategoryDTO dto=residentprogramgategorydao.detailCall(pc_idx);
		logger.info("idx확인:"+pc_idx);
		mav.addObject("list",dto);
		
		return mav;
	}

	public ModelAndView CategoryUpdateComplete(HttpServletRequest req) {
		
		String pc_idx=req.getParameter("pc_idx");
		String pc_cate=req.getParameter("pc_cate");
		
		residentprogramgategorydao.CategoryUpdateComplete(pc_idx,pc_cate);
		ModelAndView mav = new ModelAndView("resident/residentProgramGategory");
		
		return mav;
	}



}
