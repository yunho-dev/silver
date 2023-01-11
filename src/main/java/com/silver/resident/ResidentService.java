package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ResidentService {

	@Autowired ResidentDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
		
	public ModelAndView resident() {
		ModelAndView mav = new ModelAndView("resident/resident");
		logger.info("아무거나");
		ArrayList<ResidentDTO> resident = dao.resident();
		logger.info("아무거나");
		logger.info("resident size: "+resident.size());
		mav.addObject("resident", resident);
		return mav;
	}

	
	public ModelAndView residentsearch(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView("resident/resident");
		logger.info("아무거나");
		ArrayList<ResidentDTO> resident = dao.residentsearch(params);
		logger.info("아무거나");
		logger.info("resident size: "+resident.size());
		mav.addObject("resident", resident);
		return mav;
	}
	
	
	@Transactional
	public void residentdetail(String re_idx, Model model, String string) {
		ResidentDTO rd = dao.residentdetail(re_idx);
		model.addAttribute("rd", rd);
	}

	public String residentwrite(HashMap<String, String> params) {
		ResidentDTO dto = new ResidentDTO();
		dto.setRe_name(params.get("re_name"));
		dto.setRe_jumin(params.get("re_jumin"));
		dto.setRe_gender(params.get("re_gender"));
		dto.setRe_pnum(params.get("re_pnum"));
		dto.setRe_addr(params.get("re_addr"));
		dto.setRe_daddr(params.get("re_daddr"));
		dto.setRo_name(params.get("ro_name"));
		dto.setRe_grade(params.get("re_grade"));
		dto.setRe_state(params.get("re_state"));
		dto.setRe_sick(params.get("re_sick"));
		dto.setRe_text(params.get("re_text"));
			
		logger.info("dto:{}",dto);
		
		int success=dao.residentwrite(dto);
		int re_idx = dto.getRe_idx();
		logger.info("success: "+success);
		logger.info("re_idx: "+re_idx);
		
//		if(success>0 && !photo.getOriginalFilename().equals("")) {
//			fileUpload(photo, idx);
//		}
			
		return "redirect:/residentdetail.go?re_idx="+re_idx;				
		}



	

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

	



}
