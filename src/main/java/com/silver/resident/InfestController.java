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
	public String infestList() {
		return "resident/infestList";
	}
	
	@RequestMapping(value = "/infestListCall")
	@ResponseBody
	public HashMap<String, Object> infestListCall(@RequestParam int page) {
		logger.info("감염병리스트 호출");
		return infestservice.infestListCall(page);
	}
	
	@GetMapping(value = "/infestSearch")
	@ResponseBody
	public HashMap<String, Object>infestSearch(@RequestParam String select,@RequestParam String seacontent
			,@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=infestservice.searchinfestTotal(select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		logger.info("total 값 : "+total);
		logger.info("page_idx 값 : "+page_idx);
		logger.info("select 값 : "+select);
		logger.info("page 값은 : "+page);
		map.put("page_idx", page_idx);
		map.put("list", infestservice.searchinfest(select, seacontent,page));
		return map;
	}
	@GetMapping(value="/infestListHistory")
	public String infestListHistory() {
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
	public ModelAndView infestHistoryWriteUpdateForm (int re_idx) {
		logger.info("수정폼 이동");
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
