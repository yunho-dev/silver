package com.silver.boardnotice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final NoticeService notiservice;
	
	public NoticeController(NoticeService notiservice) {
		this.notiservice=notiservice;
	}
	
	@GetMapping(value="/noticeList")
	public ModelAndView noticeList() {
		return notiservice.NotilistCall();
	}
	
	
}
