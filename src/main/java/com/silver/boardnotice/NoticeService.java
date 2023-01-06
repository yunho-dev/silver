package com.silver.boardnotice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class NoticeService {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
//	private final NoticeDAO notidao;
//	
//	public NoticeService(NoticeDAO notidao) {
//		this.notidao=notidao;
//	}

	public ModelAndView NotilistCall() {
		ModelAndView mav=new ModelAndView("notice/noticeList");
		
		return mav;
	}


}
