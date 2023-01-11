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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResidentController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentService service;
	
	
	@GetMapping(value="/resident")
	public ModelAndView resident() {
		logger.info("resident");
		return service.resident();
	}
	
	
	
	@RequestMapping(value="/residentsearch.do")
	public ModelAndView residentSearch(@RequestParam HashMap<String, String> params) throws Exception {
		logger.info("residentsearch re_state: "+params.get("re_state"));	
		logger.info("residentsearch re_name: "+params.get("re_name"));	
		logger.info("params:{} ",params);
		
		
		return service.residentsearch(params);
		
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		HashMap<String, Object> requestMap = new HashMap<String, Object>();
//		
//	try {
//		String re_state = params.get("re_state");
//		requestMap.put("re_state", re_state);		
//		} catch (NullPointerException e) {
//		}
//	try {
//		String re_name = params.get("re_name");
//		requestMap.put("re_name", re_name);
//		} catch (NullPointerException e) {
//		}
//
//		logger.info("requestMap: "+requestMap);
//	    ArrayList<HashMap<String,String>> ArrayList = service.residentSearch(requestMap);
//	    logger.info("ArrayList: "+ArrayList);
//	    
//	    resultMap.put("ArrayList", ArrayList);
//	    JSONObject resultJson = new JSONObject(resultMap);
//	    
//		response.getWriter().print(resultJson);
	}
	
	
	
	
	
	
	
	
	
	
	@GetMapping(value="/residentdetail.go")
	public String residentdetail(@RequestParam String re_idx, Model model) {	
		logger.info("residentdetail re_idx: ",re_idx);
		service.residentdetail(re_idx, model,"residentdetail");		
		return "resident/residentdetail";
	}
	
	@RequestMapping(value="/residentwriteForm.go")
	public String residentwriteForm() {
		return "resident/residentwriteForm";		
	}
	
	@RequestMapping(value="/residentwrite.do")
	public String residentwrite(@RequestParam HashMap<String, String> params) {
		logger.info("residentwrite re_idx: "+params.get("re_idx"));	
		logger.info("params:{} ",params);		
		return service.residentwrite(params);
	}
	
	@RequestMapping(value="/residentupdateForm.go")
	public String updateForm(@RequestParam String re_idx, Model model) {
		logger.info("residentupdateForm idx : "+re_idx);
		service.residentdetail(re_idx, model,"resident/residentupdateForm");		
		return "resident/residentupdateForm";
	}
	
	
	@RequestMapping(value="/residentupdate.do")
	public String residentupdate(@RequestParam HashMap<String, String> params) {
		logger.info("residentupdate re_idx: "+params.get("re_idx"));
		logger.info("params:{} ",params);		
		return service.residentupdate(params);
	}
	
	
}
