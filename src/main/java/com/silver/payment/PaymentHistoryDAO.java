package com.silver.payment;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentHistoryDAO {

	ArrayList<PaymentHistoryDTO> hisList(int pm_idx);

	void PayHistoryWriteinsert(PaymentHistoryDTO phDto);

	void WriteInsert_MySangSin(PaymentHistoryDTO phDto);

	void WriteInsert_NotFinalSangSin(PaymentHistoryDTO phDto);

	void WriteInsert_FialSangSin(PaymentHistoryDTO phDto);

	void WriteInsert_BackSangSin(PaymentHistoryDTO phDto);

}
