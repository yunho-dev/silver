package com.silver.mycal;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.silver.member.MemberDTO;



@Mapper
public interface MycalDAO {
	
	// 세션 아이디 가져오기
	MycalDTO myfind(MemberDTO loginId);
	
	// 캘린더 리스트 가져오기 
	ArrayList<MycalDTO> MycalListCall(HashMap<String, String> params);
	
	// 일정 등록 
	int SaveMycalList(MycalDTO dto);
	
	// 전체 삭제
	int deleteAllevent(MycalDTO dto);




}
