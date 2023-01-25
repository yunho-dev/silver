package com.silver.mycal;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.silver.member.MemberDTO;


@Controller
public class MycalController {
	
	@Autowired MycalService service;
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
    // 개인캘린더 이동 페이지	
	@GetMapping(value="/mycalList")
	public String sidebar(Model model,HttpSession session,@RequestParam HashMap<String, String> params) {
		logger.info("개인 캘린더 조회");
		
		MemberDTO loginId = (MemberDTO) session.getAttribute("loginId");
		logger.info("loginId:"+loginId);

		
		MycalDTO dto= service.myfind(loginId);
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		model.addAttribute("info", dto);
		
		return "/mycal/mycalList";
	}
	
	// 캘린더 일정 등록
	@ResponseBody
	@PostMapping(value="SaveMycalList.do")
	public HashMap<String, Object> SaveMycalList(@RequestParam HashMap<String, Object> list) throws JsonMappingException, JsonProcessingException {
		
		logger.info("스케줄 리스트 등록");
		logger.info("list:{}",list);

		return service.SaveMycalList(list);
	}
	
	// 캘린더 목록 가져오기 
	@GetMapping(value="GETMycalList.do")
	@ResponseBody
	public HashMap<String, Object> MycalListCall(@RequestParam HashMap<String, String> params) {
		
		logger.info("내 캘린더 목록 불러오기");
		logger.info("넘겨받은 param값: "+params);
		
		
		return service.MycalListCall(params);
	}
	
}
