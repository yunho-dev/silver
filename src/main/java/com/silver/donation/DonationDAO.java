package com.silver.donation;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DonationDAO {

	int totalCount();

	ArrayList<HashMap<String, Object>> donationListCall(int offset);

	int donationWrite(HashMap<String, String> params);

	DonationDTO donationUpdateForm(int do_idx);

	int donationUpdate(HashMap<String, String> params);

	int searchdonationTotal(String select, String seacontent);

	ArrayList<DonationDTO> searchdonation(String select, String seacontent, int page);

}
