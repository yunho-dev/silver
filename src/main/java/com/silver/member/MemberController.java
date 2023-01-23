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
		
		// 직원 수정 컨트롤러
		@PostMapping(value = "/memberUpdate.do")
		@ResponseBody
		public HashMap<String, Object> memberUpdate(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("직원 수정 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.memberUpdate(memPhoto, params);
		}
		
		// 직원 수정 폼에 대한 정보 컨트롤러
		@GetMapping(value = "/getMemberUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getMemberUpdateForm(@RequestParam String memId){
			
			logger.info(memId+"사원번호에 대한 직원정보 수정 요청");
			return service.getMemberUpdateForm(memId);
		}
		
		// 직원 직책 변경 이동 컨트롤러
		@GetMapping(value="/memberGradeChange")
		public String memberGradeChange(Model model,@RequestParam HashMap<String, String> params) {
			logger.info("직원 직책 변경 이동");
			
			logger.info("세션 값 조회");
			logger.info("params:{}",params);
			model.addAttribute("page", params);
			
			return "/member/MemberGradeChange";
		}

		// 직원 직책 변경 폼에 대한 정보 컨트롤러
		@GetMapping(value = "/GrandChangeForm.go")
		@ResponseBody
		public HashMap<String, Object> GrandChangeForm(@RequestParam String memId){
			
			logger.info(memId+" 직원에 대한 직책 변경 폼 이동 요청");
			return service.GrandChangeForm(memId);
		}		
		
		
		
		// 직원 직책 변경 컨트롤러
		@PostMapping(value = "/GradeUpdateDay.do")
		@ResponseBody
		public HashMap<String, Object> GradeUpdateDay(@RequestParam HashMap<String, String> params){

			logger.info("직원 직책 변경 컨트롤러");
			logger.info("params:{}",params);
			return service.GradeUpdateDay(params);
		}
		
		
	    // 관리자 직원 리스트 이동 페이지	
		@GetMapping(value="/adminmemberList")
		public String adminmemberList(Model model,@RequestParam HashMap<String, String> params) {
			logger.info("직원 리스트 조회");
			
			logger.info("세션 값 조회");
			logger.info("params:{}",params);
			model.addAttribute("page", params);
			
			
			
			return "/member/adminMemberList";
		}
		
}
