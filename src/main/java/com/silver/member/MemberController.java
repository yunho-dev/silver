package com.silver.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired MemberService service;

    // 직원 리스트 이동 페이지	
	@GetMapping(value="/memberList")
	public String sidebar(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("직원 리스트 조회");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		
		return "/member/memberList";
	}
	
	// 직원 리스트 불러오기
	@RequestMapping(value="/memberlistCall.do")
	@ResponseBody
	public HashMap<String, Object> memberlistCall(int page){
		logger.info("Ajax 멤버 리스트 뽑아오기");
		return service.memberlist(page);
	}
	
	// 직원 리스트 검색
	@GetMapping(value = "/memberListSearch.do")
	@ResponseBody
	public HashMap<String, Object> getThingListSearch(@RequestParam HashMap<String, String> params){
		logger.info("직원 리스트 검색 기능 컨트롤러");
		logger.info("params : {} ", params);
		return service.memberListSearch(params);
	}
	
	// 마이페이지 리스트
	  @RequestMapping(value="/mypageList")
		 
	  public String mypage(Model model,HttpSession session) {
		  MemberDTO loginId = (MemberDTO) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("마이페이지 조회");
		  
		  if(session.getAttribute("loginId")!=null) {
			  MemberDTO dto =service.mypage(loginId);
				model.addAttribute("info",dto);
				logger.info("dto:"+dto);
						  
		  }else{
			  model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		  }

		  return "/member/mypageList"; 
	 }
	  
	  // 직원 상세정보 불러오기
		@GetMapping(value = "/memberdetailCall.do")
		@ResponseBody
		public HashMap<String, Object> memberdetailCall(@RequestParam String mem_name){
			
			logger.info("직원 리스트 상세정보 컨트롤러");
			logger.info("param : {} ", mem_name);
			return service.memberdetailCall(mem_name);
		}
		
		// 직원 등록
		@PostMapping(value = "/memberWrite.do")
		@ResponseBody
		public HashMap<String, Object> memberWrite(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("직원 등록 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.memberWrite(memPhoto, params);
		}
		
		// 직원 수정
		@PostMapping(value = "/memberUpdate.do")
		@ResponseBody
		public HashMap<String, Object> memberUpdate(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("직원 등록 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.memberUpdate(memPhoto, params);
		}			
	
}
