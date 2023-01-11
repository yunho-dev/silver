package com.silver.main;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;

@Service
public class MainService {
	
	@Autowired MainDAO maindao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ModelAndView MainlistCall(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("main/silverMain");
		HttpSession session=request.getSession();
		MemberDTO SessionDTO=(MemberDTO) session.getAttribute("loginId");
		logger.info("세션에 저장된 사번 : "+SessionDTO.getMem_id());
		String mem_id=SessionDTO.getMem_id();
		MainDTO memberList=maindao.MainlistCall(mem_id);
		if(!memberList.getMem_name().isEmpty()) {
			String face=maindao.searchFace(mem_id);
			logger.info("face는 :"+face);
			mav.addObject("face",face);
		}
		ArrayList<MainDTO> noticeList=maindao.noticelistCall();
		int totalResi=maindao.totalResi();
		int totalinfe=maindao.totalinfe();
		ArrayList<MainDTO> resiList=maindao.resilistCall();
		for (MainDTO mainDTO : resiList) {
			StringBuffer sb = new StringBuffer();
			String jumin = mainDTO.getRe_jumin();
			jumin="19"+jumin.substring(0,jumin.lastIndexOf("-"));
			sb.append(jumin);
			sb.insert(4, "-");
			sb.insert(7, "-");
			jumin=sb.toString();
			logger.info("주민번호"+sb);
			mainDTO.setRe_jumin(jumin);
		}
		mav.addObject("memberList",memberList);
		mav.addObject("totalResi",totalResi);
		mav.addObject("totalinfe",totalinfe);
		mav.addObject("noticeList",noticeList);
		mav.addObject("resiList",resiList);
		
		return mav;
	}






}
