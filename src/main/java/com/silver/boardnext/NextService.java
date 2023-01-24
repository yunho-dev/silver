package com.silver.boardnext;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;
import com.silver.resident.ResidentProgramDTO;

@Service
public class NextService {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired NextDAO nextdao;

//	public ArrayList<NextDTO> nextList() {
//		
//		return nextdao.nextList();
//	}

	//인수인계 글 작성완료시 실행
	public ModelAndView writecomplete(HttpServletRequest request, String bd_title, String bd_content) {

//		ModelAndView mav = new ModelAndView("next/nextList");
		ModelAndView mav = new ModelAndView("redirect:/nextList?page=board1");
		HttpSession session=request.getSession();
		MemberDTO sessionDTO=(MemberDTO) session.getAttribute("loginId");
		
		String mem_id=sessionDTO.getMem_id();
		NextDTO dto=new NextDTO();
		dto.setMem_id(mem_id);
		dto.setBd_title(bd_title);
		dto.setBd_content(bd_content);
		nextdao.writecomplete(dto);
		

		return mav;
	}
	
	//인수인계 상세보기
	public ModelAndView nextDetail(String bd_idx,@RequestParam HashMap<String, String> params) {
		//@RequestParam,mav.addObject("page",params); 이녀석은 카테고리 색깔 때문임
		
		logger.info("인수인계상세보기 서비스");
		ModelAndView mav = new ModelAndView("next/nextDetail");
		NextDTO dto = nextdao.nextDetail(bd_idx);
		mav.addObject("list",dto);
		mav.addObject("page",params);
		
		return mav;
	}

	//인수인계 업데이트 이동
	public ModelAndView nextUpdateForm(String bd_idx,@RequestParam HashMap<String, String> params) {
		//@RequestParam,mav.addObject("page",params); 이녀석은 카테고리 색깔 때문임
		ModelAndView mav = new ModelAndView("next/nextUpdateForm");
		NextDTO dto = nextdao.nextUpdateForm(bd_idx);
		logger.info("프로그램idx확인:"+bd_idx);
		mav.addObject("list",dto);
		mav.addObject("page",params);
		
		
		return mav;
	}
	
	//인수인계 업데이트 완료
	public ModelAndView nextUpdate(HttpServletRequest req) {
		
		String bd_idx =req.getParameter("bd_idx");
		String bd_title =req.getParameter("bd_title");
		//String mem_id =req.getParameter("mem_id");
		//String bd_date =req.getParameter("bd_date");
		String bd_content =req.getParameter("bd_content");
		//String bc_idx =req.getParameter("bc_idx");
		
		nextdao.nextUpdate(bd_idx,bd_title,bd_content);
		ModelAndView mav = new ModelAndView("redirect:/nextList?page=board1");
		//?page=board1 이녀석은 카테고리 색깔 때문임
		
		
		return mav;
	}
	//인수인계 리스트 총갯수
	public int nextSizeTotal() {
		
		return nextdao.nextSizeTotal();
	}
	//인수인계 리스트 10개씩
	public ArrayList<NextDTO> listCall(int page) {
		
		return nextdao.listCall(page);
	}




}
