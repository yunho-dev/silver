package com.silver.payment;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentHistoryDAO {

	ArrayList<PaymentHistoryDTO> hisList(int pm_idx);

}
