package com.silver.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberLoginService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberLoginDAO dao;
	//@Autowired PasswordEncoder encoder;
	public MemberDTO memberlogin(String id, String pw) {
		
		logger.info("로그인 서비스");
		return dao.memberlogin(id,pw);
		// TODO Auto-generated method stub
		
	}
	
	/*
	 * public boolean login(String id, String pw) { boolean match = false;
	 * logger.info(id+"/"+pw); //1.아이디로 암호와된 패스워드를 가져 온다 String enc_pw =
	 * mapper.login(id); if (enc_pw != null) { //2.암호와된 패스워드와 받아온 패스워드를 비교 match =
	 * encoder.matches(pw, enc_pw); } logger.info("match:"+match); return match;
	 * 
	 * }
	 */
	

}
