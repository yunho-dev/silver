package com.silver.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ThingDAO {

	ArrayList<ThingDTO> getThingList();

	ArrayList<ThingDTO> getThingListSearch(HashMap<String, String> params);

	ThingDTO getThingDetail(String thIdx);

	ThingDTO photoView(String thIdx);

	int thingWrite(ThingDTO dto);

	void photoInsert(String oriFileName, String newFileName, int thIdx);

	ArrayList<HashMap<String, Object>> itemCateList();

	String thingCheck(String thName);
	
}
