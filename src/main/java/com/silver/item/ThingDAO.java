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

	ArrayList<ThingDTO> getThingManageSearch(ThingDTO dto);

	int totalCountManageSearch(HashMap<String, String> params);

	int totalCntThHistory();

	ArrayList<ThingDTO> getThingHistoryList(int offset);

	int totalCountHistorySearch(HashMap<String, String> params);

	ArrayList<ThingDTO> getThingHistorySearch(ThingDTO dto);

	int thingHistoryWrite(HashMap<String, String> params);

	void writeThState(int thIdx);

	int getThIdx(String thName);

	ThingDTO getThingHistoryDetail(String hisIdx);

	int updateThingHistory(HashMap<String, Object> params);

	int totalCountThBookList();

	ArrayList<ThingDTO> getThingBookList(int offset);

	int totalCountBookSearch(HashMap<String, String> params);

	ArrayList<ThingDTO> getThingBookSearch(ThingDTO dto);

	int totalCntThResiList();

	int totalCntThMemiList();

	ArrayList<ThingDTO> thingResidentList(int offset);

	ArrayList<ThingDTO> thingMemberList(int offset);

	int totalCountThResiSearch(HashMap<String, String> params);

	int totalCountThMemSearch(HashMap<String, String> params);

	ArrayList<ThingDTO> geThResiSearch(ThingDTO dto);

	ArrayList<ThingDTO> geThMemSearch(ThingDTO dto);

	int thBookCheck(HashMap<String, String> params);

	int thingBookWrite(HashMap<String, String> params);

	ThingDTO getThingBookDetail(String cbIdx);

	int thingBookCancel(int cbIdx, String bContent, String bookWriter);

	String thNameChcek(String thName);

}
