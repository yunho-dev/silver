package com.silver.alarm;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmDAO {

	void notiAlarmInsert(String mem_name);

	ArrayList<AlarmDTO> AlarmCall(String mem_id);


}
