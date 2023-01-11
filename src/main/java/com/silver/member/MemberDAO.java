package com.silver.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	int totalCount();

	//ArrayList<MemberDTO> memberList(int offset);
	
	// 직원 리스트 가져오기
	ArrayList<MemberDTO> memberList(int offset);
	
	// 직원 필터링 검색
	ArrayList<MemberDTO> memberListSearch(MemberDTO dto);
	
	// 마이페이지 가져오기
	MemberDTO mypage(MemberDTO loginId);
	
	// 상세보기 가졍괴
	ArrayList<MemberDTO> memberdetailCall(String mem_name);
	
	// 직원 등록
	int memberWrite(MemberDTO dto);
	
	// 사진 삽입
	void photoInsert(String oriFileName, String newFileName, String memId);
	
	// 직책번호 출력
	int findpos(MemberDTO dto);
	
	// 직종번호 출력
	int findpart(MemberDTO dto);
	
	// 담당부서 번호 출력
	int finddepart(MemberDTO dto);

	String findmemID(String mem_name);

	MemberDTO photoView(String mem_id);

	int memberUpdate(MemberDTO dto);

	void photoUpdate(String oriFileName, String newFileName, String memId);

	int totalCountMemList();

	int totalCountMemFilterList(HashMap<String, String> params);

	MemberDTO getMemberUpdateForm(String memId);



}
