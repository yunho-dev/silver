package com.silver.payment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Service
public class PaymentHistoryService {
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PaymentHistoryDAO phdao;
	
	public PaymentHistoryService(PaymentHistoryDAO phdao) {
		this.phdao=phdao;
	}

	public ArrayList<PaymentHistoryDTO> hisList(int pm_idx) {
		return phdao.hisList(pm_idx);
	}

	// 내가 처음 딱 결재를 등록 했을 때
	public void WriteInsert(PaymentDTO payDto) {
		PaymentHistoryDTO phDto=new PaymentHistoryDTO(); 
		HttpServletRequest request;
		String ph_ip=null;
		request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ph_ip=request.getRemoteAddr();
		logger.info("IP 는 "+ph_ip);
		phDto.setPh_ip(ph_ip);
		phDto.setPh_name(payDto.getMem_id());
		phDto.setPh_state("등록");
		phDto.setPm_idx(payDto.getPm_idx());
		phDto.setPh_line(payDto.getMem_id());
		phdao.PayHistoryWriteinsert(phDto); // 알람 등록 이벤트 
	}

	// 처음 등록한 후 내가 상신을 했을때
	public void WriteInsert_MySangSin(PaymentDTO payDto) {
		PaymentHistoryDTO phDto=new PaymentHistoryDTO(); 
		HttpServletRequest request;
		String ph_ip=null;
		request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ph_ip=request.getRemoteAddr();
		phDto.setPm_idx(payDto.getPm_idx());
		phDto.setPh_ip(ph_ip);
		phDto.setPh_state("진행");
		phDto.setPh_name(payDto.getMem_id());
		phDto.setPh_line(payDto.getMem_id());
		phdao.WriteInsert_MySangSin(phDto);
	}

	// 최종 결재자가 아닌 사람이 상신할 경우 히스토리
	public void WriteInsert_NotFinalSangSin(PaymentDTO payDto, String writePayMent_memId) {
		PaymentHistoryDTO phDto=new PaymentHistoryDTO(); 
		HttpServletRequest request;
		String ph_ip=null;
		request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ph_ip=request.getRemoteAddr();
		phDto.setPm_idx(payDto.getPm_idx());
		phDto.setPh_ip(ph_ip);
		phDto.setPh_state("상신");
		phDto.setPh_name(writePayMent_memId);
		phDto.setPh_line(payDto.getMem_id());
		phdao.WriteInsert_NotFinalSangSin(phDto);
	}

	// 최종 결재자인 사람이 상신할 경우 히스토리
	public void WriteInsert_FialSangSin(PaymentDTO payDto, String writePayMent_memId) {
		PaymentHistoryDTO phDto=new PaymentHistoryDTO(); 
		HttpServletRequest request;
		String ph_ip=null;
		request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ph_ip=request.getRemoteAddr();
		phDto.setPm_idx(payDto.getPm_idx());
		phDto.setPh_ip(ph_ip);
		phDto.setPh_state("완료");
		phDto.setPh_name(writePayMent_memId);
		phDto.setPh_line(payDto.getMem_id());
		phdao.WriteInsert_FialSangSin(phDto);
	}

	
	// 문서 반려 시 히스토리 
	public void WriteInsert_BackSangSin(PaymentDTO payDto, String writePayMent_memId) {
		PaymentHistoryDTO phDto=new PaymentHistoryDTO(); 
		HttpServletRequest request;
		String ph_ip=null;
		request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ph_ip=request.getRemoteAddr();
		phDto.setPm_idx(payDto.getPm_idx());
		phDto.setPh_ip(ph_ip);
		phDto.setPh_state("반려");
		phDto.setPh_name(writePayMent_memId);
		phDto.setPh_line(payDto.getMem_id());
		phdao.WriteInsert_BackSangSin(phDto);
		
	}
	
	
	
	
}
