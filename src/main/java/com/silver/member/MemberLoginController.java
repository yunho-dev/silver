package com.silver.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberLoginController {

		Logger logger = LoggerFactory.getLogger(getClass());
		@Autowired MemberLoginService service;
		
		@GetMapping(value = "/")
		public String login() {
			logger.info("로그인 페이지 시작");
			return "main/memberLogin";
		}
		
		@PostMapping(value = "/memberlogin.do")
		public String memberlogin(Model model, HttpServletRequest req, @RequestParam HashMap<String, String>params) {
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			logger.info(id+"/"+pw);
			
			String page = "main/memberLogin";
			MemberDTO memberDTO = service.memberlogin(id,pw); 
			logger.info("loginId:"+memberDTO);
			
			if (memberDTO != null && !memberDTO.equals("")) {
				page = "main/silverMain";	
				HttpSession session = req.getSession();
				session.setAttribute("loginId", memberDTO.getMem_name());
				logger.info(memberDTO.getMem_id());
				logger.info(memberDTO.getMem_email());
				logger.info(memberDTO.getDept_name());
			}else {
				model.addAttribute("msg","아이디 또는 패스워드를 확인해 주세요");
			}
				model.addAttribute("id",params.get("id"));
				model.addAttribute("pw",params.get("pw"));
			return page;
		}
		
		/*
		 * @PostMapping(value = "/memberlogin.do") public String login(String id, String
		 * pw, RedirectAttributes rAttr) { service.login(id,pw); String page
		 * ="redirect:/"; String msg = "아이디 비번을 확인해 주세요";
		 * 
		 * if (service.login(id,pw) != null) { page = "main/silverMain"; msg =
		 * "안녕하세요"+id+"님"; } rAttr.addFlashAttribute("msg",msg); return page; }
		 */
}

