package com.silver.payment;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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
	
}
