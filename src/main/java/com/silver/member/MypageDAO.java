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
	
	// 마이페이지 자격증 총 갯수
	int totalCountcertList(HashMap<String, String> params);
	
	// 마이페이지 자격증 리스트 가져오기
	ArrayList<MemberDTO> certlistCall(MemberDTO dto);
	
	// 마이페이지 경력 리스트 총 갯수
	int totalCountcareerList(HashMap<String, String> params);
	
	// 마이페이지 경력 리스트 뽕아오기
	ArrayList<MemberDTO> careerlistCall(MemberDTO dto);
	
	// 마이페이지 서류파일 리스트 총 갯수
	int totalCountpaperList(HashMap<String, String> params);
	
	// 마이페이지 서류파일 리스트 뽑아오기
	ArrayList<MemberDTO> paperlistCall(MemberDTO dto);
	
	// 마이페이지 결제문서 리스트 총 갯수
	int totalCountmypaymentList(HashMap<String, String> params);
	
	// 마이페이지 결제문서 리스트 뽑아오기 
	ArrayList<MemberDTO> mypaymentlistCall(MemberDTO dto);
	
	// 마이페이지 학력 등록 
	int EduWrite(MemberDTO dto);
	
	// 마이페이지 자격증 등록
	int CertWrite(MemberDTO dto);
	
	// 마이페이지 경력 등록
	int CareerWrite(MemberDTO dto);
	
	// 마이페이지 자격증 수정 폼 요청
	MemberDTO getMemberCertUpdateForm(String Cename);
	
	// 마이페이지 학력 수정 폼 요청
	MemberDTO getMemberEduUpdateForm(String Eduname);
	
	// 마이페이지 경력 수정 폼 요청 
	MemberDTO getMemberCareerUpdateForm(String Caname);
	
	// 마이페이지 학력 수정
	int EduUpdate(MemberDTO dto);
	
	// 마이페이지 자격증 수정
	int CertUpdate(MemberDTO dto);
	
	// 마이페이지 경력 수정 
	int CareerUpdate(MemberDTO dto);
	
	// 마이페이지 비밀번호 수정 서비스 
	int ChangePassword(HashMap<String, String> params);
	
	// 서류파일 등록
	void PFileInsert(String oriFileName, String newFileName, String memId, int fpcIdx);
		
	// 서류파일 카테고리 번호 추출
	int findFpcidx(MemberDTO dto);
	
	// 서류파일 존재 유무
	MemberDTO Finddoucment(String fpidx);
	
	// 서류파일 카테고리 뽑기
	MemberDTO FindFpcateName(int fpc_idx);
	
	// 서류파일 업데이트
	void PFileUpdate(String oriFileName, String newFileName, String memId, int fpcIdx, int fcIdx);


}
