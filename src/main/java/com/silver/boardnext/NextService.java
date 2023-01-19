package com.silver.boardnext;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

	public ModelAndView writecomplete(HttpServletRequest request, String bd_title, String bd_content) {

		ModelAndView mav = new ModelAndView("next/nextList");
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

	public ModelAndView nextDetail(String bd_idx) {
		
		logger.info("인수인계상세보기 서비스");
		ModelAndView mav = new ModelAndView("next/nextDetail");
		NextDTO dto = nextdao.nextDetail(bd_idx);
		mav.addObject("list",dto);
		
		return mav;
	}


	public ModelAndView nextUpdateForm(String bd_idx) {
		ModelAndView mav = new ModelAndView("next/nextUpdateForm");
		NextDTO dto = nextdao.nextUpdateForm(bd_idx);
		logger.info("프로그램idx확인:"+bd_idx);
		mav.addObject("list",dto);
		
		return mav;
	}
	
	public ModelAndView nextUpdate(HttpServletRequest req) {
		
		String bd_idx =req.getParameter("bd_idx");
		String bd_title =req.getParameter("bd_title");
		//String mem_id =req.getParameter("mem_id");
		//String bd_date =req.getParameter("bd_date");
		String bd_content =req.getParameter("bd_content");
		//String bc_idx =req.getParameter("bc_idx");
		
		nextdao.nextUpdate(bd_idx,bd_title,bd_content);
		ModelAndView mav = new ModelAndView("next/nextList");
		
		
		
		return mav;
	}

	public int nextSizeTotal() {
		
		return nextdao.nextSizeTotal();
	}

	public ArrayList<NextDTO> listCall(int page) {
		
		return nextdao.listCall(page);
	}




}