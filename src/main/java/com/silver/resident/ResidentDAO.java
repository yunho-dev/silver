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
	ResidentDTO residentDetail(String re_idx);
	ResidentDTO Vital(int re_idx, int cu_num);
	ArrayList<ResidentFileDTO> residentFiledetail(String re_idx);
	ArrayList<ResidentFileDTO> roomListCall();

	int residentwrite(HashMap<String, String> params);
	int residentwriteCure(ResidentDTO dto);
	int residentwriteMedic(ResidentDTO dto);
	int residentwriteVital(ResidentDTO dto);
	
	int residentupdate(HashMap<String, String> params);
	int cateUpdateCure(HashMap<String, String> params);
	int cateUpdateMedic(HashMap<String, String> params);
	int cateUpdateVital(HashMap<String, String> params);

	void residentphotoInsert(String re_idx, String photooriFileName, String photonewFileName);

	void residentfileInsert(String re_idx, String photooriFileName, String photonewFileName);

	void residentphotoUpload(String re_idx, String photooriFileName, String photonewFileName);

	void residentfileUpload(String re_idx, String oriFileName, String newFileName);



	ArrayList<ResidentDTO> residentCateDetail(String re_idx);
	ArrayList<ResidentDTO> residentDateSearch(HashMap<String, String> params);

	ResidentDTO cateDetailCure(int re_idx, int cu_num);
	ResidentDTO cateDetailMedic(int re_idx, int me_num);
	ResidentDTO cateDetailVital(int re_idx, int vi_num);

	


	

	

	


	

}
