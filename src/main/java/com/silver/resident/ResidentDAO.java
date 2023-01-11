package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResidentDAO {

	ArrayList<ResidentDTO> resident();

	ArrayList<ResidentDTO> residentsearch(HashMap<String, String> params);

	ResidentDTO residentdetail(String re_idx);

	int residentwrite(ResidentDTO dto);

	int residentupdate(HashMap<String, String> params);



}
