package com.silver.resident;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResidentProgramGategoryDAO {

	ArrayList<ResidentProgramGategoryDTO> list();

	ResidentProgramGategoryDTO detailCall(String pc_idx);

	void CategoryUpdateComplete(String pc_idx, String pc_cate);



}
