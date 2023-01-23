package com.silver.boardnotice;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;

@Controller
public class NoticeController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final NoticeService notiservice;
	
	public NoticeController(NoticeService notiservice) {
		this.notiservice=notiservice;
	}
	
	@GetMapping(value="/noticeList")
	public String noticeList(Model model,@RequestParam HashMap<String, String> params) {
		model.addAttribute("page", params);
		return "notice/noticeList";
	}
	
	@ResponseBody
	@GetMapping(value="/notice/list.ajax")
	public HashMap<String, Object> noticeCall(HttpServletRequest request,@RequestParam int page) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=notiservice.noticeSizeTotal();
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<NoticeDTO> list=notiservice.listCall(page);
		HttpSession session=request.getSession();
		MemberDTO sessionDTO=(MemberDTO) session.getAttribute("loginId");
		int pos=sessionDTO.getPos_level();
		logger.info("mem_id 값 : "+sessionDTO.getMem_id());
		logger.info("pos 값 : "+pos);
		map.put("list", list);
		map.put("page_idx", page_idx);
		map.put("sessionLevel", pos);
		map.put("SessionID", sessionDTO.getMem_id());
		return map;
	}
	
	@GetMapping(value="/noticeDetail.do")
	public String noticeDetail(Model model,@RequestParam String bd_idx
			,@RequestParam HashMap<String, String> params){
		logger.info("idx 값은 : "+bd_idx);
		NoticeDTO detailDTO=notiservice.detailCall(bd_idx);
		model.addAttribute("list",detailDTO);
		logger.info("params {}",params);
		model.addAttribute("page",params);
		return "notice/noticeDetail";
	}
	
	@ResponseBody
	@GetMapping(value="/searchNotice")
	public HashMap<String, Object> searchNotice(@RequestParam String select,@RequestParam String seacontent
			,@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=notiservice.searchNoticeTotal(select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		logger.info("total 값 : "+total);
		logger.info("page_idx 값 : "+page_idx);
		logger.info("select 값 : "+select);
		logger.info("page 값은 : "+page);
		map.put("page_idx", page_idx);
		map.put("list", notiservice.searchNotice(select, seacontent,page));
		return map;
	}
	
	@GetMapping(value="/noticeWrite.do")
	public String noticeWrite(Model model,@RequestParam HashMap<String, String> params) {
		model.addAttribute("page", params);
		return "notice/noticeWrite";
	}
	
	@PostMapping(value="/write.do")
	public ModelAndView write_do(HttpServletRequest request,NoticeDTO dto) {
		logger.info("제목 : "+dto.getBd_title());
		logger.info("내용 : "+dto.getBd_content());
		return notiservice.writeBoard(request, dto.getBd_title(),dto.getBd_content());
	}
	
	@GetMapping(value="/noticeUpdate.do")
	public ModelAndView noticeUpdate_do(@RequestParam String bd_idx,@RequestParam HashMap<String, String> params) {
		return notiservice.noticeUpdateDetail(bd_idx,params);
	}
	
	@PostMapping(value="/update.do")
	public ModelAndView update_do(HttpServletRequest request) {
		logger.info("업데이트 bd_idx 값 : "+request.getParameter("bd_idx"));
		logger.info("업데이트 bd_title 값 : "+request.getParameter("bd_title"));
		logger.info("업데이트 bd_content 값 : "+request.getParameter("bd_content"));
		return notiservice.notiUpdate(request);
	}
	
	
	
	
}
