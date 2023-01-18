package com.silver.member;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberLoginController {

		Logger logger = LoggerFactory.getLogger(getClass());
		@Autowired MemberLoginService service;
		
		@GetMapping(value = "/")
		public String login() {
			logger.info("로그인 페이지 시작");
			return "main/memberLogin";
		}
		
		@PostMapping(value = "/memberlogin")
		public String memberlogin(String id, String pw,
				RedirectAttributes rAttr,
				HttpServletRequest req,
				Model model
				) {
			boolean success = service.memberlogin(id,pw,req);
			String page = "redirect:/";
			String msg = "아이디 비번밀번호를 확인해 주세요";
			
			logger.info("success 값 : "+success);
			if (success) {
				page = "redirect:/silverMain";
				msg = "안녕하세요"+id+"님";
			}
			rAttr.addFlashAttribute("msg",msg);
			
			return page;
		}
			
}

