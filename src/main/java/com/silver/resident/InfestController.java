package com.silver.resident;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfestController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired InfestService infestservice;
	
	@GetMapping(value="/infestList")
	public String infestList(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("감염병 리스트 조회");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		return "resident/infestList";
	}
	
	@RequestMapping(value = "/infestListCall")
	@ResponseBody
	public HashMap<String, Object> infestListCall(@RequestParam int page) {
		logger.info("감염병리스트 호출");
		return infestservice.infestListCall(page);
	}
	
	
	@GetMapping(value="/infestListHistory")
	public String infestListHistory(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("감염병 히스토리  조회");
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		logger.info("히스토리 이동");
		return "resident/infestListHistory";
	}
	
	@RequestMapping(value = "/infestListHistoryCall")
	@ResponseBody
	public HashMap<String, Object> infestListHistoryCall(@RequestParam int page,@RequestParam int re_idx) {
		logger.info("히스토리 호출");
		logger.info("re_idx 호출 : "+re_idx);
		//logger.info("re_idx:{}",re_idx);
		return infestservice.infestListHistoryCall(page,re_idx);
		
	}
	@RequestMapping(value ="/infestHistoryWriteForm")
	public String infestHistoryWriteForm (Model model,@RequestParam int re_idx) {
		logger.info("글쓰기폼 이동");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		model.addAttribute("re_idx",re_idx);
		
		return "resident/infestHistoryWriteForm";
	}
	@RequestMapping(value ="/infestHistoryWrite",method = RequestMethod.POST)
	public String infestHistoryWrite (Model model, 
			@RequestParam HashMap<String, String>params) {
		logger.info("params:{}"+params);
		//logger.info("re_idx:{}"+re_idx);
		infestservice.infestHistoryWrite(params);
		String re_idx= params.get("re_idx");
		return "redirect:/infestListHistory?re_idx="+re_idx;
	}
	@RequestMapping(value ="/infestHistoryWriteUpdateForm") 
	public ModelAndView infestHistoryWriteUpdateForm (Model model, int re_idx) {
		logger.info("수정폼 이동");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		logger.info("if_idx",re_idx);
		
		return infestservice.infestHistoryWriteUpdateForm(re_idx); 
	}
	 @RequestMapping(value = "/infestHistoryUpdate") 
	 public String infestHistoryUpdate(
			 @RequestParam HashMap<String, String>params) {
		 logger.info("params:{}"+params);
		 infestservice.infestHistoryUpdate(params);
		 String re_idx=params.get("re_idx");
		 return "redirect:/infestListHistory?re_idx="+re_idx;
//		 return "resident/infestListHistory?re_idx="+re_idx;
	 }
	 
}
