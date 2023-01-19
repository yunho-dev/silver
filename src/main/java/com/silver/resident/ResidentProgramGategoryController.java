package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResidentProgramGategoryController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentProgramGategoryService residentprogramgategoryservice;
	
	@GetMapping(value="/residentProgramGategory")
	public String residentProgramGategory() {
		logger.info("카테고리컨트롤러");
		
		return "resident/residentProgramGategory";
	}
	
	
	@RequestMapping(value="/listCall")
	@ResponseBody
	public HashMap<String, Object> listCall(){
		
		HashMap<String, Object> map =new HashMap<String, Object>();
		
		logger.info("컨트롤러 start");
		ArrayList<ResidentProgramGategoryDTO> list = residentprogramgategoryservice.list();
		logger.info("컨트롤러 ing");
		map.put("list", list);

		return map;
	}
	
	@GetMapping(value="/CategoryUpdate")
	public ModelAndView CategoryUpdate(@RequestParam String pc_idx) {
		
		return residentprogramgategoryservice.CategoryUpdateDetail(pc_idx);
	}
	
	@PostMapping(value="/CategoryUpdateComplete")
	public ModelAndView CategoryUpdateComplete(HttpServletRequest req) {
		logger.info("업데이트 번호:"+req.getParameter("pc_idx"));
		logger.info("업데이트 제목값:"+req.getParameter("pc_cate"));
		
		return residentprogramgategoryservice.CategoryUpdateComplete(req);
	}
	
	@GetMapping(value="/categoryWrite")
	public String writeCategory() {
		return "resident/categoryWrite";
	}
	
	@PostMapping(value="/CategoryWriteComplete")
	public ModelAndView CategoryWriteComplete(HttpServletRequest req,ResidentProgramGategoryDTO dto) {
		logger.info("번호?:"+dto.getPc_idx());
		logger.info("작성할? 내용:"+dto.getPc_cate());
		return residentprogramgategoryservice.CategoryWriteComplete(req,dto.getPc_idx(),dto.getPc_cate());
	}


}