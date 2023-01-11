package com.silver.resident;

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

	public HashMap<String, Object> infestListHistoryCall(int page) {
		int offset = (page-1)*10;
		
		int totalCount = infestDAO.totalCount1();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info("총 페이지 수:"+totalPages);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", infestDAO.infestListHistoryCall(offset));
		
		return result;
	}
	
	
	
}
