package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResdientProgramController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentProgramService residientprogramservice;
			   

	@GetMapping(value="/programList")
	public String residentProgramGategory() {
		logger.info("카테고리컨트롤러");
		
		return "resident/programList";
	}
	
	@RequestMapping(value="/ProgramlistCall")
	@ResponseBody
	public HashMap<String, Object> ProgramlistCall(){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		logger.info("프로그램 리스트콜 start");
		ArrayList<ResidentProgramDTO> programlist = residientprogramservice.programlist();
		logger.info("프로그램 리스트콜 ing");
		map.put("programlist", programlist);
		
		return map;
		
	}
	
	@GetMapping(value="/programWrite")
	public ModelAndView programWrite() {
		
		return residientprogramservice.programWrite();
		//return "resident/programWrite"; 
	}
	
	@PostMapping(value="/ProgramWriteComplete")
	public ModelAndView ProgramWriteComplete(HttpServletRequest req,ResidentProgramDTO dto) {
		logger.info("번호:"+dto.getPr_idx());
		logger.info("이름:"+dto.getPr_name());
		logger.info("선생:"+dto.getPr_teacher());
		logger.info("시작:"+dto.getPr_start());
		logger.info("끄읕:"+dto.getPr_end());
		logger.info("내용:"+dto.getPr_content());
		logger.info("목표:"+dto.getPr_goal());
		logger.info("장소:"+dto.getPr_place());
		logger.info("상태:"+dto.getPr_state());
		logger.info("카테고리:"+dto.getPc_idx());
		
		return residientprogramservice.ProgramWriteComplete(req,dto.getPr_idx(),
				dto.getPr_name(),dto.getPr_teacher(),dto.getPr_start(),dto.getPr_end(),dto.getPr_goal(),
				dto.getPr_content(),dto.getPr_place(),dto.getPr_state(),dto.getPc_idx());
	}
	
	@GetMapping(value="/programDetail")
	public ModelAndView programDetai(@RequestParam String pr_idx) {
		
		logger.info("프로그램디테일컨트롤러");
		return residientprogramservice.programDetail(pr_idx);
	}

	
	
	
	
}
