package com.silver.member;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;




@Service
public class MemberService {
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO dao;
	@Autowired PasswordEncoder encoder;
	// 직원 목록 가져오는 서비스
	public HashMap<String, Object> memberlist(int page) {
		
		int offset = 10*(page-1);
		int totalCount = dao.totalCountMemList();
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : "+totalPages);
		
		logger.info("직원 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<MemberDTO> memberList=dao.memberList(offset);
		logger.info("가져온 직원 리스트:{}",memberList);
		result.put("list", memberList);
		result.put("total", totalPages);
		return result;
	}
	
	// 직원 목록 검색 서비스
	public HashMap<String, Object> memberListSearch(HashMap<String, String> params) {
		logger.info("직원 목록 검색 기능 서비스");
		int page = Integer.parseInt(params.get("page"));
		int offset = 10*(page-1);
		int totalCount = dao.totalCountMemFilterList(params);		
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);//총 페이지 수 = 게시물 총 갯수 / 페이지당 보여줄 수 (나누기)
		logger.info("총 페이지 수 : "+totalPages);		
		MemberDTO dto= new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setMem_name(params.get("memName"));
		dto.setPart_name(params.get("memPart"));
		dto.setMem_state(params.get("memState"));
		dto.setOffset(offset);
		
		ArrayList<MemberDTO> memberList = dao.memberListSearch(dto);
		logger.info("가져온 데이터 : {}", memberList);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", memberList);
		result.put("total", totalPages);
		return result;
	}
	
	
	// 직원 상세정보 가져오기 서비스
	public HashMap<String, Object> memberdetailCall(String mem_name) {
		logger.info("직원 상세정보 가져오기 서비스");
		ArrayList<MemberDTO> memberdetailList = dao.memberdetailCall(mem_name);
		logger.info("가져온 데이터 : {}", memberdetailList);
		String mem_id= dao.findmemID(mem_name);
		MemberDTO photoDto=dao.photoView(mem_id);
		logger.info("사진 데이터:{}",photoDto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", memberdetailList);
		result.put("MemberPhoto", photoDto);
		return result;
	}
	
	// 직원 등록 서비스 
	public HashMap<String, Object> memberWrite(MultipartFile memPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date memDate = Date.valueOf(params.get("memIndate"));
		dto.setMem_name(params.get("memName"));
		dto.setMem_id(params.get("memId"));
		dto.setDept_name(params.get("departName"));
		dto.setMem_indate(memDate);
		dto.setMem_birth(params.get("memBirth"));	
		dto.setMem_addr(params.get("memAddr"));
		dto.setPos_name(params.get("posName"));
		dto.setPart_name(params.get("partName"));
		dto.setMem_pnum(params.get("memPnum"));
		dto.setMem_gender(params.get("memGender"));
		dto.setMem_daddr(params.get("memDaddr"));
		dto.setMem_email(params.get("memEmail"));
		dto.setMem_num(params.get("memId"));
		
		
		// dto.setMem_pw(params.get("memPw")); 
		String plain_pw=params.get("memPw");
		String enc_pw=encoder.encode(plain_pw);
		
		logger.info("plain_pw:"+plain_pw);
		logger.info("enc_pw:"+enc_pw);		
		dto.setMem_pw(enc_pw);
		
		
		dto.setPos_num(dao.findpos(dto));
		dto.setPart_num(dao.findpart(dto));
		dto.setDept_num(dao.finddepart(dto));
		
		logger.info("추출된 번호1:"+dao.findpos(dto));
		logger.info("추출된 번호2:"+dao.findpart(dto));
		logger.info("추출된 번호3:"+dao.finddepart(dto));
		
		int row = dao.memberWrite(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("insert한 memId : "+memId);
		
		if(memPhoto != null){
			String oriFileName = memPhoto.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = fileSave(memPhoto,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("")) {
					dao.photoInsert(oriFileName, newFileName, memId);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}

	// 파일 저장 등록
	private String fileSave(MultipartFile photo, String ext) {
		logger.info("파일 저장 기능 접근");
		// 1. 새 파일명 생성
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("서버에 저장될 파일명이 생성되었습니다. 파일명 : "+newFileName);
		
		// 2. 저장
		try {
			byte[] bytes = photo.getBytes();
			//Path path = Paths.get("C:/filephoto/"+newFileName);
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/filephoto/"+newFileName);
			logger.info("저장될 파일 경로 : {}", path);
			Files.write(path, bytes);
			logger.info("파일 저장 완료");
		} catch (IOException e) {
			logger.info("파일 저장 실패! 저장될 파일 이름을 초기화합니다.");
			newFileName = "";
			e.toString();
		}
		
		// 3. 새 파일 명 반환
		return newFileName;
	}

	
	// 직원 업데이트 서비스 
	public HashMap<String, Object> memberUpdate(MultipartFile memPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date memDate = Date.valueOf(params.get("memIndate"));
		dto.setMem_name(params.get("memName"));
		dto.setMem_id(params.get("memId"));
		dto.setDept_name(params.get("departName"));
		dto.setMem_indate(memDate);
		dto.setMem_birth(params.get("memBirth"));	
		dto.setMem_addr(params.get("memAddr"));
		dto.setPos_name(params.get("posName"));
		dto.setPart_name(params.get("partName"));
		dto.setMem_pnum(params.get("memPnum"));
		dto.setMem_gender(params.get("memGender"));
		dto.setMem_daddr(params.get("memDaddr"));
		dto.setMem_email(params.get("memEmail"));
		dto.setMem_num(params.get("memId"));
		dto.setMem_state(params.get("memState"));
		
		//dto.setMem_pw(params.get("memPw"));
		
		String plain_pw=params.get("memPw");
		String enc_pw=encoder.encode(plain_pw);
		
		logger.info("plain_pw:"+plain_pw);
		logger.info("enc_pw:"+enc_pw);		
		dto.setMem_pw(enc_pw);
		
		dto.setPos_num(dao.findpos(dto));
		dto.setPart_num(dao.findpart(dto));
		dto.setDept_num(dao.finddepart(dto));
		
		logger.info("추출된 번호1:"+dao.findpos(dto));
		logger.info("추출된 번호2:"+dao.findpart(dto));
		logger.info("추출된 번호3:"+dao.finddepart(dto));
		
		int row = dao.memberUpdate(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("insert한 memId : "+memId);
		
		if(memPhoto != null){
			MemberDTO photofind = dao.findphoto(memId);
			String oriFileName = memPhoto.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = fileSave(memPhoto,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("") && photofind != null ) {
					dao.photoUpdate(oriFileName, newFileName, memId);
				}else if(!newFileName.equals("") && photofind == null) {
					dao.photoInsert(oriFileName, newFileName, memId);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 직원 업데이트 개인정보 가져오는 서비스 
	public HashMap<String, Object> getMemberUpdateForm(String memId) {
		MemberDTO  dto = dao.getMemberUpdateForm(memId);
		logger.info("가져온 데이터 : {}", dto);
		MemberDTO photoDto = dao.photoView(memId);
		logger.info("사진데이터 : {}", photoDto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		result.put("detailPhoto", photoDto);
		return result;

	}
	
	
	// 직원 직책 변경 서비스 
	public HashMap<String, Object> GradeUpdateDay(HashMap<String, String> params) {
		MemberDTO dto = new MemberDTO();

		dto.setMem_id(params.get("memId"));
		dto.setPos_name(params.get("posName"));
		dto.setPos_num(dao.findpos(dto));
		logger.info("추출된 번호1:"+dao.findpos(dto));


		int row = dao.GradeUpdateDay(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("Update한 memId : "+memId);
		
		
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 직원 직책 변경 폼 이동 서비스 
	public HashMap<String, Object> GrandChangeForm(String memId) {
		MemberDTO  dto = dao.GrandChangeForm(memId);
		logger.info("가져온 데이터 : {}", dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		return result;
	}



}
