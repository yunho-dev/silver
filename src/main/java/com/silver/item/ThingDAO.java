package com.silver.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ThingDAO {

	ArrayList<ThingDTO> getThingList(int offset);

	ArrayList<ThingDTO> getThingListSearch(ThingDTO dto);

	ThingDTO getThingDetail(String thIdx);

	ThingDTO photoView(String thIdx);

	int thingWrite(ThingDTO dto);

	void photoInsert(String oriFileName, String newFileName, int thIdx);

	ArrayList<ThingDTO> itemCateList();

	String thingCheck(String thName);

	int thingUpdate(HashMap<String, String> params);

	void photoUpdate(String oriFileName, String newFileName, String string);

	int totalCountThList();

	int totalCountThFilterList(HashMap<String, String> params);

	String cateNameCheck(String cateName);

	int itemCateResist(String cateName);

	int itemCateUpdate(int itIdx, String cateName);

	ArrayList<ThingDTO> getItemSearch(String itName);

	ArrayList<ThingDTO> getThingManageList(int offset);

	int totalCntThManage();

	ArrayList<HashMap<String, Object>> getThingManageSearch(HashMap<String, String> params);
	
}
