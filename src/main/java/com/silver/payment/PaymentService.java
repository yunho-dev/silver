package com.silver.payment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.silver.member.MemberDTO;

@Service
public class PaymentService {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PaymentDAO paymentdao;
	
	public PaymentService(PaymentDAO paymentdao) {
		this.paymentdao=paymentdao;
	}

	public ArrayList<PaymentDTO> MyPayListCall(HttpServletRequest request, int page) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
				
		return paymentdao.MyPayListCall(mem_id,page);
	}

	public int MyPayListCallTotal(HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		return paymentdao.MyPayListCallTotal(mem_id);
	}
	
	
	
	

}
