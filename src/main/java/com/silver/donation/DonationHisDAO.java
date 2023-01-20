package com.silver.donation;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.silver.member.MemberDTO;

@Mapper
public interface DonationHisDAO {

	int searchdonationHisTotal = 0;

	int totalCount();

	ArrayList<HashMap<String, Object>> donHistoryCall(int offset);

	int donWrite(DonationHisDTO dto);

	void photoInsert(String oriFileName, String newFileName, int dhidx);

	DonationHisDTO donHisUpdateForm(int dh_idx);

	int donHisUpdate(DonationHisDTO dto);

	DonationHisDTO findphoto(int dh_idx);

	void photoUpdate(String oriFileName, String newFileName, int dhidx);

	String donHisUpdateForm_File(int dh_idx);

	int searchdonationHisTotal(String select, String seacontent);

	ArrayList<DonationHisDTO> searchHisdonation(String select, String seacontent, int page);

	

}
