package com.silver.resident;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfestController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired InfestService infestservice;
	
	@GetMapping(value="/infestList")
	public String infestList() {
		return "resident/infestList";
	}
	
	@RequestMapping(value = "/infestListCall")
	@ResponseBody
	public HashMap<String, Object> infestListCall(@RequestParam int page) {
		logger.info("감염병리스트 호출");
		return infestservice.infestListCall(page);
	}
	
	@GetMapping(value="/infestListHistory")
	public String infestListHistory() {
		logger.info("히스토리 이동");
		return "resident/infestListHistory";
	}
	
	@RequestMapping(value = "/infestListHistoryCall")
	@ResponseBody
	public HashMap<String, Object> infestListHistoryCall(@RequestParam int page) {
		logger.info("히스토리 호출");
		return infestservice.infestListHistoryCall(page);
		
	}
	
	@RequestMapping(value ="/infestHistoryWriteForm")
	public String infestHistoryWriteForm () {
		logger.info("글쓰기폼 이동");
		return "resident/infestHistoryWriteForm";
		
	}
	
	
}
