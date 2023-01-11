package com.silver.alarm;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmDAO {

	void notiAlarmInsert(String mem_name, String linkaddr);

	ArrayList<AlarmDTO> AlarmCall(String mem_id);

	int removeCount(int idx);


}
