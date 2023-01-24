package com.silver.payment;

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
public class PayFormService {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PayFormDAO payformdao;
	
	public PayFormService(PayFormDAO payformdao) {
		this.payformdao=payformdao;
	}

	public ArrayList<PayFormDTO> mylistCall(HttpServletRequest request, int page) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		logger.info("payform mem_id 값 : "+mem_id);
		
		return payformdao.mylistCall(mem_id,page);
	}

	public int mylistCallTotal(HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		return payformdao.mylistCallTotal(mem_id);
	}

	public int AlllistCallTotal() {
		return payformdao.AlllistCallTotal();
	}

	public ArrayList<PayFormDTO> alllistCall(int page) {
		return payformdao.alllistCall(page);
	}

	public ModelAndView payfromdetail(int pf_idx, HashMap<String, String> params) {
		ModelAndView mav=new ModelAndView();
		PayFormDTO detailDTO=payformdao.payfromdetail(pf_idx);
		mav.addObject("payformDetail",detailDTO);
		mav.addObject("page",params);
		mav.setViewName("payment/detailPayForm");
		return mav;
	}

	public int payformdelete(int idx) {
		return payformdao.payformdelete(idx);
	}

	public ModelAndView payformupdate_go(int pf_idx, HashMap<String, String> params) {
		ModelAndView mav=new ModelAndView("payment/updatePayForm");
		PayFormDTO detailDTO=payformdao.payfromdetail(pf_idx);
		mav.addObject("payformUpdate",detailDTO);
		mav.addObject("page",params);
		return mav;
	}

	public ModelAndView payformupdate_do(HttpServletRequest request) {
		String pf_idx=request.getParameter("pf_idx");
		String selected=request.getParameter("selected");
		String pf_title=request.getParameter("pf_title");
		String pf_content=request.getParameter("pf_content");
		ModelAndView mav=new ModelAndView();
		payformdao.payformupdate_do(pf_idx,selected,pf_title,pf_content);
		mav.setViewName("redirect:/payfromdetail?page=payment&pf_idx="+pf_idx);
		return mav;
	}

	public ModelAndView writepayForm_do(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		String selected=request.getParameter("selected");
		String pf_title=request.getParameter("pf_title");
		String pf_content=request.getParameter("pf_content");
		PayFormDTO payformDTO=new PayFormDTO();
		payformDTO.setPf_cate(selected);
		payformDTO.setPf_subject(pf_title);
		payformDTO.setPf_content(pf_content);
		payformDTO.setMem_id(mem_id);
		payformdao.writepayForm_do(payformDTO);
		int pf_idx=payformDTO.getPf_idx();
		logger.info("pf_idx 값 체크 : "+pf_idx);
		mav.setViewName("redirect:/payfromdetail?page=payment&pf_idx="+pf_idx);
		
		return mav;
	}


	public int AllFormSearchTotal(HttpServletRequest request)  {
		String select=request.getParameter("select");
		String seacontent=request.getParameter("seacontent");
		return payformdao.AllFormSearchTotal(select,seacontent);
	}

	public ArrayList<PayFormDTO> AllFormSearch(HttpServletRequest request, int page) {
		String select=request.getParameter("select");
		String seacontent=request.getParameter("seacontent");
		return payformdao.AllFormSearch(select,seacontent,page);
	}
	
	
	
	
	
	
	
	
	

}
