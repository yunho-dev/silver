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
			
			logger.info(memId+" 사원번호에 대한 마이페이지 수정 요청");
			return service.getMypageUpdateForm(memId);
		}
		
		// 마이 페이지 수정 컨트롤러
		@PostMapping(value = "/mypageUpdate.do")
		@ResponseBody
		public HashMap<String, Object> mypageUpdate(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("마이페이지 수정 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.mypageUpdate(memPhoto, params);
		}
		
		// 마이페이지 학력 리스트 불러오기
		@RequestMapping(value="/edulistCall.do")
		@ResponseBody
		public HashMap<String, Object> edulistCall(@RequestParam HashMap<String, String> params){
			logger.info("마이페이지 학력 뽑아오기");
			return service.edulistCall(params);
		}

		// 마이페이지 자격증 리스트 불러오기
		@RequestMapping(value="/certlistCall.do")
		@ResponseBody
		public HashMap<String, Object> certlistCall(@RequestParam HashMap<String, String> params){
			logger.info("마이페이지 자격증 뽑아오기");
			return service.certlistCall(params);
		}

		// 마이페이지 경력 리스트 불러오기
		@RequestMapping(value="/careerlistCall.do")
		@ResponseBody
		public HashMap<String, Object> careerlistCall(@RequestParam HashMap<String, String> params){
			logger.info("마이페이지 경력 뽑아오기");
			return service.careerlistCall(params);
		}

		// 마이페이지 서류파일 리스트 불러오기
		@RequestMapping(value="/paperlistCall.do")
		@ResponseBody
		public HashMap<String, Object> paperlistCall(@RequestParam HashMap<String, String> params){
			logger.info("마이페이지 경력 뽑아오기");
			return service.paperlistCall(params);
		}		

		// 마이페이지 결제문서 리스트 불러오기
		@RequestMapping(value="/mypaymentlistCall.do")
		@ResponseBody
		public HashMap<String, Object> mypaymentlistCall(@RequestParam HashMap<String, String> params){
			logger.info("마이페이지 결제문서 뽑아오기");
			return service.mypaymentlistCall(params);
		}
		
		// 마이페이지 학력 등록
		@PostMapping(value = "/EduWrite.do")
		@ResponseBody
		public HashMap<String, Object> EduWrite(@RequestParam HashMap<String, String> params){

			logger.info("학력 등록 컨트롤러");
			logger.info("params:{}",params);
			return service.EduWrite(params);
		}

		// 마이페이지 자격증 등록
		@PostMapping(value = "/CertWrite.do")
		@ResponseBody
		public HashMap<String, Object> CertWrite(@RequestParam HashMap<String, String> params){

			logger.info("자격증 등록 컨트롤러");
			logger.info("params:{}",params);
			return service.CertWrite(params);
		}		
		
		// 마이페이지 경력 등록
		@PostMapping(value = "/CareerWrite.do")
		@ResponseBody
		public HashMap<String, Object> CareerWrite(@RequestParam HashMap<String, String> params){

			logger.info("경력 등록 컨트롤러");
			logger.info("params:{}",params);
			return service.CareerWrite(params);
		}	
		
		
		
		// 마이페이지 자격증 수정 폼에 대한 정보 컨트롤러
		@GetMapping(value = "/getMemberCertUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getMemberCertUpdateForm(@RequestParam String Cename){
			
			logger.info(Cename+" 자격증에 대한 정보 수정 요청");
			return service.getMemberCertUpdateForm(Cename);
		}
		
		// 마이페이지 학력 수정 폼에 대한 정보 컨트롤러
		@GetMapping(value = "/getMemberEduUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getMemberEduUpdateForm(@RequestParam String Eduname){
			
			logger.info(Eduname+" 학력에 대한 정보 수정 요청");
			return service.getMemberEduUpdateForm(Eduname);
		}
		
		// 마이페이지 경력 수정 폼에 대한 정보 컨트롤러
		@GetMapping(value = "/getMemberCareerUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getMemberCareerUpdateForm(@RequestParam String Caname){
			
			logger.info(Caname+" 경력에 대한 정보 수정 요청");
			return service.getMemberCareerUpdateForm(Caname);
		}
		
		
		// 마이페이지 학력 수정
		@PostMapping(value = "/EduUpdate.do")
		@ResponseBody
		public HashMap<String, Object> EduUpdate(@RequestParam HashMap<String, String> params){

			logger.info("학력 수정 컨트롤러");
			logger.info("params:{}",params);
			return service.EduUpdate(params);
		}

		// 마이페이지 자격증 수정
		@PostMapping(value = "/CertUpdate.do")
		@ResponseBody
		public HashMap<String, Object> CertUpdate(@RequestParam HashMap<String, String> params){

			logger.info("자격증 수정 컨트롤러");
			logger.info("params:{}",params);
			return service.CertUpdate(params);
		}		
		
		// 마이페이지 경력 수정
		@PostMapping(value = "/CareerUpdate.do")
		@ResponseBody
		public HashMap<String, Object> CareerUpdate(@RequestParam HashMap<String, String> params){

			logger.info("경력 수정 컨트롤러");
			logger.info("params:{}",params);
			return service.CareerUpdate(params);
		}			
		
		// 마이페이지 비밀번호 수정
		@PostMapping(value = "/ChangePassword.do")
		@ResponseBody
		public HashMap<String, Object> ChangePassword(@RequestParam HashMap<String, String> params){

			logger.info("비밀번호 수정 컨트롤러");
			logger.info("params:{}",params);
			return service.ChangePassword(params);
		}
		
		// 마이페이지 서류파일 등록
		@PostMapping(value = "/memberwriteFileInsert.do")
		@ResponseBody
		public HashMap<String, Object> memberwriteFileInsert(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("서류파일 등록 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.memberwriteFileInsert(memPhoto, params);
		}
		
		// 마이페이지 서류파일 수정 폼 이동
		@GetMapping(value = "/getdocuFileUpdateForm.go")
		@ResponseBody
		public HashMap<String, Object> getdocuFileUpdateForm(@RequestParam String Fpidx){
			
			logger.info(Fpidx +" 서류파일에 대한 전자서명 수정 요청");
			return service.getdocuFileUpdateForm(Fpidx);
		}
		
		// 마이페이지 서류파일 수정
		@PostMapping(value = "/memberdocuFileUpdateForm.do")
		@ResponseBody
		public HashMap<String, Object> memberdocuFileUpdateForm(MultipartFile memPhoto, @RequestParam HashMap<String, String> params){
			logger.info("서류파일 등록 컨트롤러");
			logger.info("params:{}",params);
			logger.info("memPhoto:{}",memPhoto);
			return service.memberdocuFileUpdateForm(memPhoto, params);
		}		
}
