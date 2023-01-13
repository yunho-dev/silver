package com.silver.member;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MypageService {
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired MypageDAO dao;

	// 파일 저장 등록
	private String fileSave(MultipartFile photo, String ext) {
		logger.info("파일 저장 기능 접근");
		// 1. 새 파일명 생성
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("서버에 저장될 파일명이 생성되었습니다. 파일명 : "+newFileName);
		
		// 2. 저장
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/filephoto/"+newFileName);
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

	// 마이페이지 가져오기 서비스
	public MemberDTO mypage(MemberDTO loginId) {
		logger.info("마이페이지 개인정보 가져오기 서비스");
		
		return dao.mypage(loginId);
	}
	
	// 마이페이지 프로필 사진 가져오기
	public MemberDTO mypage2(MemberDTO loginId) {
		logger.info("마이페이지 개인 프로필 사진 가져오기 서비스");
		
		return dao.mypage2(loginId);
	}

	// 마이페이지 전자서명 가져오기
	public MemberDTO mypage3(MemberDTO loginId) {
		logger.info("마이페이지 전자서명 가져오기");
		
		return dao.mypage3(loginId);
	}
	
	// 마이 페이지 전자서명 수정 정보 가졍오기
	public HashMap<String, Object> getMemberSignUpdateForm(String memId) {
		
		MemberDTO dto = dao.IDFind(memId);
		MemberDTO photoDto = dao.SignView(memId);
		logger.info("사진데이터 : {}", photoDto);
		logger.info("아이디 정보:{}",dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detailPhoto", photoDto);
		result.put("myId", dto);
		return result;
	}
	
	// 마이 페이지 전자서명 업데이트
	public HashMap<String, Object> memberSignUpdate(MultipartFile signPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(params.get("memId"));
		String memId = dto.getMem_id();
		if(signPhoto != null){
			MemberDTO photofind = dao.findsignphoto(memId);
			String oriFileName = signPhoto.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = SignSave(signPhoto,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("") && photofind != null ) {
					dao.signphotoUpdate(oriFileName, newFileName, memId);
				}else if(!newFileName.equals("") && photofind == null) {
					dao.signphotoInsert(oriFileName, newFileName, memId);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}

	// 전자서명 파일 등록
	private String SignSave(MultipartFile photo, String ext) {
		logger.info("파일 저장 기능 접근");
		// 1. 새 파일명 생성
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("서버에 저장될 파일명이 생성되었습니다. 파일명 : "+newFileName);
		
		// 2. 저장
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/sign/"+newFileName);
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
	
	// 마이페이지 업데이트 개인정보 가져오는 서비스
	public HashMap<String, Object> getMypageUpdateForm(String memId) {
		MemberDTO  dto = dao.getMypageUpdateForm(memId);
		logger.info("가져온 데이터 : {}", dto);
		MemberDTO photoDto = dao.photoMypageView(memId);
		logger.info("사진데이터 : {}", photoDto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		result.put("detailPhoto", photoDto);
		return result;

	}
	
	// 마이페이지 업데이트 서비스
	public HashMap<String, Object> mypageUpdate(MultipartFile memPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setMem_addr(params.get("memAddr"));
		dto.setMem_pnum(params.get("memPnum"));
		dto.setMem_daddr(params.get("memDaddr"));
		dto.setMem_email(params.get("memEmail"));
		
		int row = dao.mypageUpdate(dto);
		String memId = dto.getMem_id();
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
	
	// 마이페이지 학력 리스트 가져오기 서비스
	public HashMap<String, Object> edulistCall(HashMap<String, String> params) {
		logger.info("학력 가져오기 서비스");
		int page = Integer.parseInt(params.get("page"));
		int offset = 10*(page-1);
		int totalCount = dao.totalCounteduList(params);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : "+totalPages);
		
		MemberDTO dto= new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setOffset(offset);
		
		logger.info("학력 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> eduList=dao.edulistCall(dto);
		logger.info("가져온 학력 리스트:{}",eduList);
		result.put("list", eduList);
		result.put("total", totalPages);
		return result;
	}
}
