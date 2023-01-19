package com.silver.boardnext;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.silver.boardnotice.NoticeDTO;
import com.silver.member.MemberDTO;

@Controller
public class NextController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired NextService nextservice;
	
	@GetMapping(value="/nextList")
	public String nextList() {
		logger.info("인수인계컨트롤러");
		
		return "next/nextList";
	}
	
//	@RequestMapping(value="/nextListCall")
//	@ResponseBody
//	public HashMap<String, Object> nextListCall(){
//	
//	HashMap<String, Object> map = new HashMap<String, Object>();
//	
//	logger.info("인수인계 리스트콜");
//	ArrayList<NextDTO> nextList = nextservice.nextList();
//	map.put("nextList", nextList);
//	
//	return map;
//	}
	
	@GetMapping(value="/nextWrite")
	public String nextWrite() {
		
		 return "next/nextWrite";
	}
	
	@PostMapping(value="/writecomplete")
	public ModelAndView write_do(HttpServletRequest request,NextDTO dto) {
		logger.info("제목 : "+dto.getBd_title());
		logger.info("내용 : "+dto.getBd_content());
		return nextservice.writecomplete(request, dto.getBd_title(),dto.getBd_content());
	}
	
	@GetMapping(value="/nextDetail")
	public ModelAndView nextDetail(@RequestParam String bd_idx){
		logger.info("idx 값은:"+bd_idx);
		
		return nextservice.nextDetail(bd_idx);		
	}
	
	@GetMapping(value="/nextUpdateForm")
	public ModelAndView nextUpdateForm(@RequestParam String bd_idx) {
		
		logger.info("인수인계 컨트롤러:"+bd_idx);
		return nextservice.nextUpdateForm(bd_idx);
	}

	
	@PostMapping(value="/nextUpdate")
	public ModelAndView nextUpdate(HttpServletRequest req) {

		logger.info("수정할 글번호"+req.getParameter("bd_title"));
		logger.info("수정할 내용"+req.getParameter("bd_content"));
		
		return nextservice.nextUpdate(req);
	}
	
	
	@GetMapping(value="/nextListCall.ajax")
	@ResponseBody
	public HashMap<String, Object> nextListCall(HttpServletRequest request,@RequestParam int page) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=nextservice.nextSizeTotal();
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<NextDTO> list=nextservice.listCall(page);
//		HttpSession session=request.getSession();
//		MemberDTO sessionDTO=(MemberDTO) session.getAttribute("loginId");
//		int pos=sessionDTO.getPos_level();
//		logger.info("mem_id 값 : "+sessionDTO.getMem_id());
//		logger.info("pos 값 : "+pos);
		map.put("list", list);
		map.put("page_idx", page_idx);
//		map.put("sessionLevel", pos);
//		map.put("SessionID", sessionDTO.getMem_id());
		return map;
	}
	

	
	
}

