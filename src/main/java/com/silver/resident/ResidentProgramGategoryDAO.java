package com.silver.resident;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResidentProgramGategoryDAO {
	//프로그램카테고리 리스트
	ArrayList<ResidentProgramGategoryDTO> list();
	//프로그램카테고리 상세보기 페이지이동
	ResidentProgramGategoryDTO detailCall(String pc_idx);
	//프로그램카테고리 수정
	void CategoryUpdateComplete(String pc_idx, String pc_cate);
	//프로그램카테고리 작성
	int CategoryWriteComplete(ResidentProgramGategoryDTO dto);



}
