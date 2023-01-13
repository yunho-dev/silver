package com.silver.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberOrgChartDAO {

	ArrayList<MemberDTO> memberOrgChartCall();

}
