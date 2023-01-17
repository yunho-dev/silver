package com.silver.item;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarDAO {

	ArrayList<CarDTO> carList();

	ArrayList<ThingDTO> getDriveHistory(int carIdx);

	ArrayList<ThingDTO> getCarBookList(int carIdx);

}
