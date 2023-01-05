package com.silver.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainService service;
	
	@GetMapping(value="/")
	public String home() {
		logger.info("메인 컨트롤러 시작");
		String msg = service.test();
		logger.info("msg 의 값은 : "+msg);
		return "main/index";
	}

}
