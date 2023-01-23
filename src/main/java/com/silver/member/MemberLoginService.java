package com.silver.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberLoginService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberLoginDAO mapper; 
	@Autowired PasswordEncoder encoder;
	
	
	
	public boolean memberlogin(String id,String pw,
			HttpServletRequest req) {
		boolean match = false;
		logger.info(id+"/"+pw);
		//1.아이디로 암호와된 패스워드를 가져 온다
		MemberDTO dto = mapper.memberlogin(id);
		if (dto.getMem_pw()!= null) {
			//2.암호와된 패스워드와 받아온 패스워드를 비교
			match = encoder.matches(pw, dto.getMem_pw());
			
			 HttpSession session =req.getSession();
			 session.setAttribute("loginId",dto);
			 int hope =dto.getPos_level();
			 session.setAttribute("hope", hope);
			 
			 MemberDTO MDTO=(MemberDTO) session.getAttribute("loginId");
				
			 	logger.info(MDTO.getMem_id()); 
			 /*logger.info(MDTO.getMem_num());
			 * logger.info(MDTO.getMem_gender()); 
			 * logger.info(MDTO.getMem_addr());
			 */
		
		}
		
		
		logger.info("match:"+match);
		return match;
		
	}
	
	
	 
	 
	

}
