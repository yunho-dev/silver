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
		}else if(AlarmCate.equals("결재 진행")) {
			content=mem_name+"님의 결재 문서 처리 바랍니다.";
			String Linkaddr=LinkAddr(result, AlarmCate);
			alarmdao.PayAlarmInsert(content,Linkaddr,mem_id);
		}else if(AlarmCate.equals("결재 완료")) {
			content=mem_name+"님의 결재 문서 최종 결재 되었습니다..";
			String Linkaddr=LinkAddr(result, AlarmCate);
			alarmdao.PayAlarmInsert(content,Linkaddr,mem_id);
		}else if(AlarmCate.equals("결재 반려")) {
			content=mem_name+"님의 결재 문서 반려 되었습니다..";
			String Linkaddr=LinkAddr(result, AlarmCate);
			alarmdao.PayAlarmInsert(content,Linkaddr,mem_id);
		}
		
		
	}
	
	public String LinkAddr(int idx,String alarmCate) {
		String page="";
		if(alarmCate.equals("공지사항")) {
			page="noticeDetail.do?page=board2&bd_idx="+idx;
		}else if(alarmCate.equals("결재 문서")) {
			page="detailPayment.do?page=payment&pm_idx="+idx;
		}else if(alarmCate.equals("결재 진행")) {
			page="detailPayment.do?page=payment&pm_idx="+idx;
		}else if(alarmCate.equals("결재 완료")) {
			page="detailPayment.do?page=payment&pm_idx="+idx;
		}else if(alarmCate.equals("결재 반려")) {
			page="detailPayment.do?page=payment&pm_idx="+idx;
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
