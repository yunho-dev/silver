package com.silver.donation;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface DonationHisDAO {

	int totalCount();

	ArrayList<HashMap<String, Object>> donHistoryCall(int offset);

	

	

	int donWrite(DonationHisDTO dto);

	void photoInsert(String oriFileName, String newFileName, int dhidx);

	DonationHisDTO donHisUpdateForm(int dh_idx);

	

}
