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
public class MypageController {
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired MypageService service;

	// 마이페이지 리스트
	  @RequestMapping(value="/mypageList")
		 
	  public String mypage(Model model,HttpSession session) {
		  MemberDTO loginId = (MemberDTO) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("마이페이지 조회");
		  
		  if(session.getAttribute("loginId")!=null) {
			  MemberDTO dto =service.mypage(loginId);
			  MemberDTO photodto =service.mypage2(loginId);
			  MemberDTO signdto = service.mypage3(loginId);
			  
			  model.addAttribute("info",dto);
			  model.addAttribute("photoinfo", photodto);
			  model.addAttribute("signinfo", signdto);
				logger.info("dto:"+dto);
				logger.info("photoinfo:"+photodto);
				logger.info("signinfo:"+signdto);
						  
		  }else{
			  model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		  }

		  return "/member/mypageList"; 
	 }
	  
		// 마이페이지 전자서명 수정 정보 가져오는 컨트롤러
		@GetMapping(value = "/getMemberSignUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getMemberSignUpdateForm(@RequestParam String memId){
			
			logger.info(memId+"사원번호에 대한 전자서명 수정 요청");
			return service.getMemberSignUpdateForm(memId);
		}
		
		// 마이페이지 전자서명 수정 컨트롤러
		@PostMapping(value = "/memberSignUpdate.do")
		@ResponseBody
		public HashMap<String, Object> memberSignUpdate(MultipartFile signPhoto, @RequestParam HashMap<String, String> params){
			logger.info("전자서명 수정 컨트롤러");
			logger.info("params:{}",params);
			logger.info("signPhoto:{}",signPhoto);
			return service.memberSignUpdate(signPhoto, params);
		}	
		
		// 마이페이지 수정 폼에 대한 정보 컨트롤러
		@GetMapping(value = "/getMypageUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getMypageUpdateForm(@RequestParam String memId){
			
			logger.info(memId+" 사원번호에 대한 직원정보 수정 요청");
			return service.getMypageUpdateForm(memId);
		}
		
		// 마이 페이지 수정 컨트롤러
		@PostMapping(value = "/mypageUpdate.do")
		@ResponseBody
		public HashMap<String, Object> mypageUpdate(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("직원 수정 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.mypageUpdate(memPhoto, params);
		}
		
		// 마이페이지 학력 리스트 불러오기
		@RequestMapping(value="/edulistCall.do")
		@ResponseBody
		public HashMap<String, Object> edulistCall(@RequestParam HashMap<String, String> params){
			logger.info("Ajax 멤버 학력 뽑아오기");
			return service.edulistCall(params);
		}
		
}
