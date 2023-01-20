package com.silver.boardnext;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.silver.resident.ResidentProgramDTO;

@Mapper
public interface NextDAO {

//	ArrayList<NextDTO> nextList();

	//인수인계 글 작성완료시 실행
	void writecomplete(NextDTO dto);
	//인수인계 상세보기
	NextDTO nextDetail(String bd_idx);
	//인수인계 업데이트 이동
	NextDTO nextUpdateForm(String bd_idx);
	//인수인계 업데이트 완료
	void nextUpdate(String bd_idx,String bd_title, String bd_content);
	//인수인계 리스트 총갯수
	int nextSizeTotal();
	//인수인계 리스트 10개씩
	ArrayList<NextDTO> listCall(int page);




}
