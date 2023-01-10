package com.silver.alarm;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.silver.member.MemberDTO;

@Service
public class AlarmService {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final AlarmDAO alarmdao;
	
	public AlarmService(AlarmDAO alarmdao) {
		this.alarmdao=alarmdao;
	}
	
	public void notiAlarm(String mem_name, int result) {
		logger.info("asdad");
		String content=mem_name+"님이 공지사항을 등록했습니다.";
		alarmdao.notiAlarmInsert(content);
	}

	public HashMap<String, Object> AlarmCall(HttpServletRequest request) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		logger.info("알람 mem_id"+mem_id);
		ArrayList<AlarmDTO> list=alarmdao.AlarmCall(mem_id);
		map.put("allist",list);
		return map;
	}
}
