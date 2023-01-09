package com.silver.boardnotice;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final NoticeService notiservice;
	
	public NoticeController(NoticeService notiservice) {
		this.notiservice=notiservice;
	}
	
	@GetMapping(value="/noticeList")
	public String noticeList() {
		return "notice/noticeList";
	}
	
	@ResponseBody
	@GetMapping(value="/notice/list.ajax")
	public HashMap<String, Object> noticeCall(@RequestParam int page) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=notiservice.noticeSizeTotal();
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<NoticeDTO> list=notiservice.listCall(page);
		map.put("list", list);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@ResponseBody 
	@GetMapping(value="/notice/detail.ajax")
	public HashMap<String, Object> noticeDetail(@RequestParam String bd_idx){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("idx 값은 : "+bd_idx);
		NoticeDTO detailDTO=notiservice.detailCall(bd_idx);
		map.put("detail", detailDTO);
		return map;
	}
	
	
	
}
