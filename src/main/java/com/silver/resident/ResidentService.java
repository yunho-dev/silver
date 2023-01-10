package com.silver.resident;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

}
