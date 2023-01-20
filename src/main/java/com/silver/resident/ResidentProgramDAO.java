package com.silver.resident;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.silver.boardnext.NextDTO;

@Mapper
public interface ResidentProgramDAO {

//	ArrayList<ResidentProgramDTO> programlist();
	
	//프로그램 작성
	int ProgramWriteComplete(ResidentProgramDTO dto);
	//프로그램 해당 idx의 상세보기
	ResidentProgramDTO programDetail(String pr_idx);
	//프로그램 카테고리 리스트
	ArrayList<ResidentProgramDTO> procategoryList();
	//프로그램 수정
	void programDetailUpdate(String pr_idx, String pr_name, String pr_teacher, String pr_start, String pr_end,
			String pr_goal, String pr_content, String pr_place, String pr_state, String pc_idx);
	//프로그램 리스트 총갯수
	int residientprogramSizeTotal();
	//프로그램 리스트 10개씩
	ArrayList<ResidentProgramDTO> listCall(int page);

}
