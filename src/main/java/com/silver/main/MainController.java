package com.silver.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainService mainservice;
	
	@GetMapping(value="/silverMain")
	public ModelAndView home(HttpServletRequest request) {
		logger.info("메인 컨트롤러 시작!!");
		
		return mainservice.MainlistCall(request);
	}

}
