package com.silver.donation;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class DonationService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DonationDAO dao;
	
	public HashMap<String, Object> donationListCall(int page) {
		logger.info("후원금 리스트 호출"+page);
		
		int offset = (page-1)*10;
		
		int totalCount = dao.totalCount();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info("총 페이지 수:"+totalPages);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", dao.donationListCall(offset));
		
		return result;
	
	}

	public void donationWrite(HashMap<String, String> params) {
		int row = dao.donationWrite(params);
		
	}

	public ModelAndView donationUpdateForm(int do_idx) {
		logger.info("서비스 이동확인");
		DonationDTO dto = dao.donationUpdateForm(do_idx);
		ModelAndView mav = new ModelAndView("donation/donationUpdateForm");
		logger.info("do_idx",do_idx);
		mav.addObject("donation",dto);
		return mav;
	}

	public void donationUpdate(HashMap<String, String> params) {
		logger.info("서비스 이동확인");
		logger.info("params:{}",params);
		int row = dao.donationUpdate(params);
		
	}

	public int searchdonationTotal(String select, String seacontent) {
		
		return dao.searchdonationTotal(select,seacontent);
				
	}

	public Object searchdonation(String select, String seacontent, int page) {
		ArrayList<DonationDTO> list = dao.searchdonation(select,seacontent,page);
		return list;
	}










}
