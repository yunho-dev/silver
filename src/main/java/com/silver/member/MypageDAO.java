package com.silver.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDAO {
	
	// 마이페이지 가져오기
	MemberDTO mypage(MemberDTO loginId);
	
	// 마이페이지 포로필 사진 가져오기
	MemberDTO mypage2(MemberDTO loginId);
	
	// 마이페이지 전자서명 가져오기 
	MemberDTO mypage3(MemberDTO loginId);
	
	// 전자서명 가져오기
	MemberDTO SignView(String memId);
	
	// 전자서명 유무 확인
	MemberDTO findsignphoto(String memId);
	
	// 마이페이지 아이디 확인
	MemberDTO IDFind(String memId);
	
	// 전자서명 업데이트
	void signphotoUpdate(String oriFileName, String newFileName, String memId);
	
	// 전자서명 삽입
	void signphotoInsert(String oriFileName, String newFileName, String memId);
	
	// 마이페이지 업데이트 개인정보 가져오기
	MemberDTO getMypageUpdateForm(String memId);
	
	// 마이페이지 업데이트 개인 프로필 사진 가져오기
	MemberDTO photoMypageView(String memId);
	
	// 마이페이지 정보 업데이트
	int mypageUpdate(MemberDTO dto);
	
	// 마이페이지 개인 프로필 사진 유무 확인
	MemberDTO findphoto(String memId);
	
	// 마이페이지 프로필사진 업데이트
	void photoUpdate(String oriFileName, String newFileName, String memId);
	
	// 마이페이지 프로필 사진 삽입
	void photoInsert(String oriFileName, String newFileName, String memId);
	
	// 마이페이지 학력 총 갯수
	int totalCounteduList(HashMap<String, String> params);
	
	// 마이페이지 학력 리스트 가져오기
	ArrayList<MemberDTO> edulistCall(MemberDTO dto);

}
