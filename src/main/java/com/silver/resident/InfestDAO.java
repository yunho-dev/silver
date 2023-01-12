package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfestDAO {

	

	

	ArrayList<HashMap<String, Object>> infestListCall(int offset);

	int totalCount();

	ArrayList<HashMap<String, Object>> infestListHistoryCall(int offset, int re_idx);

	int totalCount1();

	int searchinfestTotal(String select, String seacontent);

	ArrayList<InfestDTO> searchinfest(String select, String seacontent, int page);

	int infestHistoryWrite(HashMap<String, String> params);

	int infestHistoryUpdate(HashMap<String, String> params);

	

	InfestDTO infestHistoryWriteUpdateForm(int if_idx);

	

	

}
