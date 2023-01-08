package com.silver.resident;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfestController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired InfestService infestservice;
	
	@GetMapping(value = "/infestList")
	public String infestList() {
		
		logger.info("감염병창으로 이동");
		return "resident/infestList";
		
	}
}
