package com.silver.boardnext;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.silver.resident.ResidentProgramDTO;

@Mapper
public interface NextDAO {

//	ArrayList<NextDTO> nextList();

	void writecomplete(NextDTO dto);

	NextDTO nextDetail(String bd_idx);

	NextDTO nextUpdateForm(String bd_idx);

	void nextUpdate(String bd_idx,String bd_title, String bd_content);

	int nextSizeTotal();

	ArrayList<NextDTO> listCall(int page);




}
