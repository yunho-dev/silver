package com.silver.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	int totalCount();

	// 직원 리스트 가져오기
	ArrayList<MemberDTO> memberList(int offset);
	
	// 직원 필터링 검색
	ArrayList<MemberDTO> memberListSearch(MemberDTO dto);
		
	// 상세보기 가져오기
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
	
	// 아이디 정보 확인
	String findmemID(String mem_name);
	
	// 직원 상세 정보 사진 가져오기
	MemberDTO photoView(String mem_id);
	
	// 직원 업데이트 
	int memberUpdate(MemberDTO dto);
	
	// 직원 사진 업데이트
	void photoUpdate(String oriFileName, String newFileName, String memId);
	
	// 직원 리스트 총 인원수
	int totalCountMemList();
	
	// 직원 검색 필터링 총 인원수
	int totalCountMemFilterList(HashMap<String, String> params);
	
	// 직원 수정폼 이동 데이터 가져오기
	MemberDTO getMemberUpdateForm(String memId);
	
	// 직원 사진 업데이트시 사진 유무 판별
	MemberDTO findphoto(String memId);
	
	// 직원 직책 변경 
	int GradeUpdateDay(MemberDTO dto);
	
	// 직원 직책 변경 폼 이동
	MemberDTO GrandChangeForm(String memId);






}
