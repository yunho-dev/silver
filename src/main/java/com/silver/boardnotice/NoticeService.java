package com.silver.boardnotice;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;

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

	public int searchNoticeTotal(String select, String seacontent) {
		return notidao.searchNoticeTotal(select,seacontent);
	}

	public Object searchNotice(String select, String seacontent, int page) {
		ArrayList<NoticeDTO> list=notidao.searchNotice(select,seacontent,page);
		return list;
	}

	public ModelAndView writeBoard(HttpServletRequest request,String bd_title, String bd_content) {
		ModelAndView mav=new ModelAndView("notice/noticeList");
		HttpSession session=request.getSession();
		MemberDTO sessionDTO=(MemberDTO) session.getAttribute("loginId");
		int pos=sessionDTO.getPos_level();
		if(!(pos < 4)) {
			mav.addObject("msg","팀장 이상 직급만 공지사항 등록이 가능합니다.");
			mav.setViewName("redirect:/noticeList");
		}
		String mem_id=sessionDTO.getMem_id();
		int row=notidao.writeBoard(mem_id,bd_title,bd_content);
		return mav;
	}

	public ModelAndView noticeUpdateDetail(String bd_idx) {
		ModelAndView mav=new ModelAndView("notice/noticeUpdate");
		NoticeDTO dto=notidao.detailCall(bd_idx);
		mav.addObject("list",dto);
		return mav;
	}

	public ModelAndView notiUpdate(HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDTO sessionDTO=(MemberDTO) session.getAttribute("loginId");
		String bd_idx=request.getParameter("bd_idx");
		String bd_title=request.getParameter("bd_title");
		String bd_content=request.getParameter("bd_content");
		String mem_id=sessionDTO.getMem_id();
		notidao.notiUpdate(bd_idx,mem_id,bd_title,bd_content);
		ModelAndView mav=new ModelAndView("redirect:/noticeDetail.do?bd_idx="+bd_idx);
		return mav;
	}








}
