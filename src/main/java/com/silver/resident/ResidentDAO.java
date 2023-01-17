package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResidentDAO {

	ArrayList<ResidentDTO> resident();

	ArrayList<ResidentDTO> residentsearch(HashMap<String, String> params);
	ArrayList<ResidentDTO> residentCateSearch(HashMap<String, String> params);

	ResidentDTO residentdetail(String re_idx);
	ResidentDTO residentCateDetail(String re_idx);
	ArrayList<ResidentFileDTO> residentFiledetail(String re_idx);

	int residentwrite(HashMap<String, String> params);

	int residentupdate(HashMap<String, String> params);

	void residentphotoInsert(String re_idx, String photooriFileName, String photonewFileName);

	void residentfileInsert(String re_idx, String photooriFileName, String photonewFileName);

	void residentphotoUpload(String re_idx, String photooriFileName, String photonewFileName);

	void residentfileUpload(String re_idx, String oriFileName, String newFileName);


	

}
