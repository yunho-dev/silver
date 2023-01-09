package com.silver.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

	MainDTO MainlistCall(String mem_id);

	String searchFace(String mem_id);

	int totalResi();

	int totalinfe();

	ArrayList<MainDTO> noticelistCall();

	ArrayList<MainDTO> resilistCall();

}
