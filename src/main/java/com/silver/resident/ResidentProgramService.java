package com.silver.resident;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ResidentProgramService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentProgramDAO residentprogramdao;

	public ArrayList<ResidentProgramDTO> programlist() {
		
		logger.info("프로그램 리스트 service");
		return residentprogramdao.programlist();
	}

	public ModelAndView ProgramWriteComplete(HttpServletRequest req, int pr_idx, String pr_name, String pr_teacher,
			Timestamp pr_start, Timestamp pr_end,String pr_goal, String pr_content, String pr_place, String pr_state,int pc_idx) {
		
		ResidentProgramDTO dto = new ResidentProgramDTO();
		dto.setPr_idx(pr_idx);
		dto.setPr_name(pr_name);
		dto.setPr_teacher(pr_teacher);
		dto.setPr_start(pr_start);
		dto.setPr_end(pr_end);
		dto.setPr_goal(pr_goal);
		dto.setPr_content(pr_content);
		dto.setPr_place(pr_place);
		dto.setPr_state(pr_state);
		dto.setPc_idx(pc_idx);
		
		int row = residentprogramdao.ProgramWriteComplete(dto);
		ModelAndView mav = new ModelAndView("resident/programList");
//		ArrayList<ResidentProgramDTO> procategoryList = residentprogramdao.procategoryList();
//		mav.addObject("procategory",procategoryList);
		
		return mav;
	}

	public ModelAndView programWrite() {
		
		ModelAndView mav = new ModelAndView("resident/programWrite");
		ArrayList<ResidentProgramDTO> procategoryList = residentprogramdao.procategoryList();
		mav.addObject("procategory",procategoryList);
		return mav;
	}

	public ModelAndView programDetail(String pr_idx) {
		
		logger.info("프로그램디테일서비스");
		ModelAndView mav = new ModelAndView("resident/programDetail");
		ResidentProgramDTO dto = residentprogramdao.programDetail(pr_idx);
		logger.info("프로그램idx확인:"+pr_idx);
		mav.addObject("list",dto);

		
		return mav;
	}



}
