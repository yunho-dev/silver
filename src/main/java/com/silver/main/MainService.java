package com.silver.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MainService {
	
	@Autowired MainDAO Maindao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public static ModelAndView MainlistCall() {
		ModelAndView mav=new ModelAndView("main/index");
		
		return mav;
	}



}
