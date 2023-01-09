package com.silver.boardnotice;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class NoticeService {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final NoticeDAO notidao;
	
	public NoticeService(NoticeDAO notidao) {
		this.notidao=notidao;
	}

	public ArrayList<NoticeDTO> listCall(int page) {
		
		return notidao.listCall(page);
	}

	public int noticeSizeTotal() {
		return notidao.noticeSizeTotal();
	}

	public NoticeDTO detailCall(String bd_idx) {
		return notidao.detailCall(bd_idx);
	}







}
