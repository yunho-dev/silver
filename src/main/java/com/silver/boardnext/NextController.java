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
	
	//인수인계 리스트 페이지 이동
	@GetMapping(value="/nextList")
	public String nextList(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("인수인계 컨트롤러");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		//@RequestParam,mav.addObject("page",params); 이녀석은 카테고리 색깔 때문임
		
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
	
	//인수인계 글 작성페이지 이동
	@GetMapping(value="/nextWrite")
	public String nextWrite(Model model, @RequestParam HashMap<String, String> params) {
		//@RequestParam,mav.addObject("page",params); 이녀석은 카테고리 색깔 때문임
		
		model.addAttribute("page",params);
		
		return "next/nextWrite";
	}
	
	//인수인계 글 작성완료시 실행
	@PostMapping(value="/writecomplete")
	public ModelAndView write_do(HttpServletRequest request,NextDTO dto) {
		logger.info("제목 : "+dto.getBd_title());
		logger.info("내용 : "+dto.getBd_content());
		return nextservice.writecomplete(request, dto.getBd_title(),dto.getBd_content());
	}
	
	//인수인계 상세보기
	@GetMapping(value="/nextDetail")
	public ModelAndView nextDetail(@RequestParam String bd_idx,@RequestParam HashMap<String, String> params){
		//@RequestParam,mav.addObject("page",params); 이녀석은 카테고리 색깔 때문임
		
		logger.info("idx 값은:"+bd_idx);
		
		return nextservice.nextDetail(bd_idx,params);		
	}
	
	//인수인계 업데이트 이동
	@GetMapping(value="/nextUpdateForm")
	public ModelAndView nextUpdateForm(@RequestParam String bd_idx,@RequestParam HashMap<String, String> params) {
		//@RequestParam,mav.addObject("page",params); 이녀석은 카테고리 색깔 때문임
		
		logger.info("인수인계 컨트롤러:"+bd_idx);
		return nextservice.nextUpdateForm(bd_idx,params);
	}

	//인수인계 업데이트 완료
	@PostMapping(value="/nextUpdate")
	public ModelAndView nextUpdate(HttpServletRequest req) {

		logger.info("수정할 글번호"+req.getParameter("bd_title"));
		logger.info("수정할 내용"+req.getParameter("bd_content"));
		
		return nextservice.nextUpdate(req);
	}
	
	//인수인계 리스트 가져오기(페이징)
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

