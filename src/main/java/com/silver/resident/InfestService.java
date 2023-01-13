package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class InfestService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired InfestDAO infestDAO;
	
	public HashMap<String, Object> infestListCall(int page) {
		logger.info("감염병 리스트 호출"+page);
		
		int offset = (page-1)*10;
		
		int totalCount = infestDAO.totalCount();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info("총 페이지 수:"+totalPages);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", infestDAO.infestListCall(offset));
		
		return result;
	}

	public HashMap<String, Object> infestListHistoryCall(int page, int re_idx) {
		int offset = (page-1)*10;
		
		int totalCount = infestDAO.totalCount1();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info("총 페이지 수:"+totalPages);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", infestDAO.infestListHistoryCall(offset,re_idx));
		
		return result;
	}

	public int searchinfestTotal(String select, String seacontent) {
		
		return infestDAO.searchinfestTotal(select,seacontent);
	}

	public Object searchinfest(String select, String seacontent, int page) {
		ArrayList<InfestDTO>list = infestDAO.searchinfest(select,seacontent,page);
		return list;
	}

	public void infestHistoryWrite(HashMap<String, String> params) {
		int row = infestDAO.infestHistoryWrite(params);
		
	}
	

	public void infestHistoryUpdate(HashMap<String, String> params) {
		logger.info("데이터 이동 확인");
		logger.info("params:{}",params);
		int row = infestDAO.infestHistoryUpdate(params);
		
	}

	public ModelAndView infestHistoryWriteUpdateForm(int if_idx) {
		logger.info("이동확인");
		InfestDTO dto = infestDAO.infestHistoryWriteUpdateForm(if_idx);
		ModelAndView mav = new ModelAndView("resident/infestHistoryWriteUpdateForm");
		logger.info("if_idx:{}",if_idx);
		mav.addObject("infest",dto);//"infest"이름은 infestHistoryWriteUpdateForm의 form태그 안의 value${infest.if_jusa}이 infest 와 같이 설정해야함
		return mav;
	}


	

	
	
	
	
	
}
