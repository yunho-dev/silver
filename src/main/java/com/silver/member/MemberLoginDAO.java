package com.silver.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberLoginDAO {

	

	MemberDTO memberlogin(String id, String pw);

	

}
