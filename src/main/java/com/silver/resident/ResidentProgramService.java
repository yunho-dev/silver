package com.silver.resident;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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

	public ModelAndView programDetailUpdate(HttpServletRequest req) {
		
		String pr_idx=req.getParameter("pr_idx");
		String pr_name=req.getParameter("pr_name");
		String pr_teacher=req.getParameter("pr_teacher");
		String pr_start=req.getParameter("pr_start");
		String pr_end=req.getParameter("pr_end");
		String pr_goal=req.getParameter("pr_goal");
		String pr_content=req.getParameter("pr_content");
		String pr_place=req.getParameter("pr_place");
		String pr_state=req.getParameter("pr_state");
		//int pc_idx=Integer.parseInt(req.getParameter("pc_idx"));
		String pc_idxTwo=req.getParameter("pc_idxTwo");
		logger.info("프로그램 업데이트");
		logger.info("pc_idx : "+pc_idxTwo);
		
		residentprogramdao.programDetailUpdate(pr_idx,pr_name,pr_teacher,
				pr_start,pr_end,pr_goal,pr_content,pr_place,pr_state,pc_idxTwo);
		ModelAndView mav = new ModelAndView("resident/programList");

		return mav;
	}



}
