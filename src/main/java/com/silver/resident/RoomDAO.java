package com.silver.resident;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomDAO {

	//ArrayList<RoomDTO> roomList();

	ArrayList<RoomDTO> memList();

	int roomWrite(String floor, String inroomName, String total, String damdangSelect);

	ArrayList<RoomDTO> showroomlist();

	ArrayList<RoomDTO> roomlistCall();
	
	





	

}
