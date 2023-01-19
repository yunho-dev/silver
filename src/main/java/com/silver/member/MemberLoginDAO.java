package com.silver.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberLoginDAO {

	

	MemberDTO memberlogin(String id);

	

}
