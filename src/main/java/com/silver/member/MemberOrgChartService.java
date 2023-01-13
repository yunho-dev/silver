package com.silver.member;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberOrgChartService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberOrgChartDAO dao;
	
	public ArrayList<MemberDTO> memberOrgChartCall() {
		logger.info("서비스로 넘어갔는지 확인");
		return dao.memberOrgChartCall();
	}

}
