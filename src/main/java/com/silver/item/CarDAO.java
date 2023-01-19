package com.silver.item;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarDAO {

	ArrayList<CarDTO> carList();

	ArrayList<ThingDTO> getDriveHistory(int carIdx, int offset);

	int totalCountDriveHistory(int carIdx);
	
	ArrayList<ThingDTO> getCarBookList(int carIdx, int offset);
	
	int totalCountCarBookList(int carIdx);

	int carHistoryResist(HashMap<String, String> params);

	int carResist(HashMap<String, String> params);

	CarDTO getCarInfo(int carIdx);

	int carModify(HashMap<String, String> params);

	CarDTO getDriveHistoryModifyInfo(int chisIdx);

	int carHistoryModify(HashMap<String, String> params);

	int carBookResist(HashMap<String, String> params);

	int carBookCheck(HashMap<String, String> params);

	CarDTO getCarBookDetail(int cbIdx);

}
