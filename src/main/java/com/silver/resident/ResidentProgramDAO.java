package com.silver.resident;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResidentProgramDAO {

	ArrayList<ResidentProgramDTO> programlist();

	int ProgramWriteComplete(ResidentProgramDTO dto);

	ArrayList<ResidentProgramDTO> procategoryList();

	ResidentProgramDTO programDetail(String pr_idx);

}
