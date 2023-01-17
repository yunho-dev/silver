package com.silver.resident;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResidentProgramDAO {

	ArrayList<ResidentProgramDTO> programlist();

	int ProgramWriteComplete(ResidentProgramDTO dto);

	ArrayList<ResidentProgramDTO> procategoryList();

	ResidentProgramDTO programDetail(String pr_idx);

	void programDetailUpdate(String pr_idx, String pr_name, String pr_teacher, String pr_start, String pr_end,
			String pr_goal, String pr_content, String pr_place, String pr_state, String pc_idxTwo);

}
