package com.silver.resident;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResidentController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentService service;
	
	
	@GetMapping(value="/resident")
	public ModelAndView resident() {
		logger.info("아무거나");
		return service.resident();
	}
	
	
	
}
