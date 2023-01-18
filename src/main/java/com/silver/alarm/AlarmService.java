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
	
	public void notiAlarm(String mem_name, int result, String AlarmCate, String mem_id) {
		logger.info("asdad");
		logger.info("mem_name 값 : "+mem_name);
		logger.info("mem_id 값 : "+mem_id);
		
		String content="";
		if(AlarmCate.equals("결재 문서")){
			content=mem_name+"님이 결재 문서를 등록했습니다.";
			String Linkaddr=LinkAddr(result, AlarmCate);
			alarmdao.PayAlarmInsert(content,Linkaddr,mem_id);
		}else if(AlarmCate.equals("공지사항")) {
			content=mem_name+"님이 공지사항을 등록했습니다.";
			String Linkaddr=LinkAddr(result, AlarmCate);
			alarmdao.notiAlarmInsert(content,Linkaddr,mem_id);
		}
		
		
	}
	
	public String LinkAddr(int idx,String alarmCate) {
		String page="";
		if(alarmCate.equals("공지사항")) {
			page="noticeDetail.do?bd_idx="+idx;
		}else if(alarmCate.equals("결재 문서")) {
			page="detailPayment.do?pm_idx="+idx;
		}
		return page;
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

	public int removeCount(int idx) {
		return alarmdao.removeCount(idx);
	}
	
	
}
