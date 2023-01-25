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
public class MypageService {
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired MypageDAO dao;
	@Autowired PasswordEncoder encoder;

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
			//Path path = Paths.get("C:/sign/"+newFileName);
			Path path = Paths.get("/usr/local/tomcat/webapps/silver/sign/"+newFileName);
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
	
	// 마이페이지 자격증 리스트 뽑아오기 서비스
	public HashMap<String, Object> certlistCall(HashMap<String, String> params) {
		logger.info("자격증 가져오기 서비스");
		int page = Integer.parseInt(params.get("page"));
		int offset = 10*(page-1);
		int totalCount = dao.totalCountcertList(params);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : "+totalPages);
		
		MemberDTO dto= new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setOffset(offset);
		
		logger.info("자격증 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> certList=dao.certlistCall(dto);
		logger.info("가져온 자격증 리스트:{}",certList);
		result.put("list", certList);
		result.put("total", totalPages);
		return result;
	}
	
	// 마이페이지 경력 리스트 뽑아오기 서비스
	public HashMap<String, Object> careerlistCall(HashMap<String, String> params) {
		logger.info("경력 가져오기 서비스");
		int page = Integer.parseInt(params.get("page"));
		int offset = 10*(page-1);
		int totalCount = dao.totalCountcareerList(params);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : "+totalPages);
		
		MemberDTO dto= new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setOffset(offset);
		
		logger.info("경력 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> careerList=dao.careerlistCall(dto);
		logger.info("가져온 경력 리스트:{}",careerList);
		result.put("list", careerList);
		result.put("total", totalPages);
		return result;
	}
	
	
	// 마이페이지 서류파일 리스트 뽑아오기
	public HashMap<String, Object> paperlistCall(HashMap<String, String> params) {
		logger.info("서류파일 가져오기 서비스");
		int page = Integer.parseInt(params.get("page"));
		int offset = 10*(page-1);
		int totalCount = dao.totalCountpaperList(params);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : "+totalPages);
		
		MemberDTO dto= new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setOffset(offset);
		
		logger.info("서류파일 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> paperList=dao.paperlistCall(dto);
		logger.info("dto :"+dto);
		logger.info("가져온 서류파일 리스트:{}",paperList);
		result.put("list", paperList);
		result.put("total", totalPages);
		return result;
	}
	
	// 마이페이지 결제문서 리스트 뽑아오기 
	public HashMap<String, Object> mypaymentlistCall(HashMap<String, String> params) {
		logger.info("결제문서 리스트 가져오기 서비스");
		int page = Integer.parseInt(params.get("page"));
		int offset = 10*(page-1);
		int totalCount = dao.totalCountmypaymentList(params);
		logger.info("params: "+params);
		logger.info("게시글 총 개수 : "+totalCount);
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : "+totalPages);
		
		MemberDTO dto= new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setOffset(offset);
		
		logger.info("결제문서 목록을 가져오는 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ArrayList<MemberDTO> mypaymentList=dao.mypaymentlistCall(dto);
		logger.info("가져온 결제문서 리스트:{}",mypaymentList);
		result.put("list", mypaymentList);
		result.put("total", totalPages);
		return result;
	}
	
	// 마이페이지 학력 등록 서비스 
	public HashMap<String, Object> EduWrite(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date EduStart = Date.valueOf(params.get("eduStart"));
		Date EduEnd = Date.valueOf(params.get("eduEnd"));
		dto.setEdu_start(EduStart);
		dto.setEdu_end(EduEnd);
		
		dto.setMem_id(params.get("memId"));
		dto.setEdu_name(params.get("eduName"));
		dto.setEdu_pass(params.get("eduPass"));	
		dto.setEdu_success(params.get("eduSuccess"));

		
		
		int row = dao.EduWrite(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("insert한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 마이페이지 자격증 등록 서비스
	public HashMap<String, Object> CertWrite(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date CertDate = Date.valueOf(params.get("certDate"));
		dto.setCe_date(CertDate);

		
		dto.setMem_id(params.get("memId"));
		dto.setCe_name(params.get("certName"));
		dto.setCe_place(params.get("certPlace"));	


		
		
		int row = dao.CertWrite(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("insert한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 마이페이지 경력 등록 서비스
	public HashMap<String, Object> CareerWrite(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date CareerStart = Date.valueOf(params.get("careerStart"));
		Date CareerEnd = Date.valueOf(params.get("careerEnd"));
		dto.setCa_start(CareerStart);
		dto.setCa_end(CareerEnd);
		
		dto.setMem_id(params.get("memId"));
		dto.setCa_name(params.get("careerName"));
		dto.setCa_work(params.get("careerWork"));	
		dto.setCa_pos(params.get("careerPos"));

		
		
		int row = dao.CareerWrite(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("insert한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 마이페이지 자격증 수정 폼에 대한 서비스
	public HashMap<String, Object> getMemberCertUpdateForm(String Cename) {
		MemberDTO  dto = dao.getMemberCertUpdateForm(Cename);
		logger.info("가져온 데이터 : {}", dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		return result;
	}

	// 마이페이지 학력 수정 폼에 대한 서비스
	public HashMap<String, Object> getMemberEduUpdateForm(String Eduname) {
		MemberDTO  dto = dao.getMemberEduUpdateForm(Eduname);
		logger.info("가져온 데이터 : {}", dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		return result;
	}	
	
	// 마이페이지 경력 수정 폼에 대한 서비스
	public HashMap<String, Object> getMemberCareerUpdateForm(String Caname) {
		MemberDTO  dto = dao.getMemberCareerUpdateForm(Caname);
		logger.info("가져온 데이터 : {}", dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		return result;
	}
	
	// 마이페이지 학력 수정 서비스
	public HashMap<String, Object> EduUpdate(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date EduStart = Date.valueOf(params.get("eduStart"));
		Date EduEnd = Date.valueOf(params.get("eduEnd"));
		dto.setEdu_start(EduStart);
		dto.setEdu_end(EduEnd);
		
		dto.setMem_id(params.get("memId"));
		dto.setEdu_name(params.get("eduName"));
		dto.setEdu_pass(params.get("eduPass"));	
		dto.setEdu_success(params.get("eduSuccess"));
		dto.setEdu_idx(Integer.parseInt(params.get("eduIdx")));
		
		
		int row = dao.EduUpdate(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("Update한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 마이페이지 자격증 수정 서비스
	public HashMap<String, Object> CertUpdate(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date CertDate = Date.valueOf(params.get("certDate"));
		dto.setCe_date(CertDate);

		
		dto.setMem_id(params.get("memId"));
		dto.setCe_name(params.get("certName"));
		dto.setCe_place(params.get("certPlace"));	
		dto.setCe_idx(Integer.parseInt(params.get("certIdx")));

		
		
		int row = dao.CertUpdate(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("Update한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 마이페이지 경력 수정 서비스
	public HashMap<String, Object> CareerUpdate(HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		Date CareerStart = Date.valueOf(params.get("careerStart"));
		Date CareerEnd = Date.valueOf(params.get("careerEnd"));
		dto.setCa_start(CareerStart);
		dto.setCa_end(CareerEnd);
		
		dto.setMem_id(params.get("memId"));
		dto.setCa_name(params.get("careerName"));
		dto.setCa_work(params.get("careerWork"));	
		dto.setCa_pos(params.get("careerPos"));
		dto.setCa_idx(Integer.parseInt(params.get("careerIdx")));

		
		
		int row = dao.CareerUpdate(dto);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+row);
		logger.info("Update한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	// 비밀번호 수정 서비스 
	public HashMap<String, Object> ChangePassword(HashMap<String, String> params) {
		logger.info("비밀번호 수정 서비스");
		logger.info("params:{}",params);
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(params.get("memId"));
		String plain_pw =params.get("memNpw");
		String enc_pw =encoder.encode(plain_pw);
		logger.info("plain_pw:"+plain_pw);
		logger.info("enc_pw:"+enc_pw);
		
		params.put("pw", enc_pw);
		logger.info("params:{}",params);
		
		int success= dao.ChangePassword(params);
		logger.info("change success:"+success);
		String memId = dto.getMem_id();
		logger.info("db table 영향받은 행의 개수 : "+success);
		logger.info("Update한 memId : "+memId);
		
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;		
	}
	
	// 서류파일 등록 서비스 
	public HashMap<String, Object> memberwriteFileInsert(MultipartFile memPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setFpc_cate(params.get("fpcCate"));
		
		dto.setFpc_idx(dao.findFpcidx(dto));

		
		logger.info("추출된 번호:"+dao.findFpcidx(dto));
		
		
		int FpcIdx=dto.getFpc_idx();

		String memId = dto.getMem_id();

		
		if(memPhoto != null){
			String oriFileName = memPhoto.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = pfileSave(memPhoto,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("")) {
					dao.PFileInsert(oriFileName, newFileName,memId,FpcIdx);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}
	
	private String pfileSave(MultipartFile photo, String ext) {
		logger.info("파일 저장 기능 접근");
		// 1. 새 파일명 생성
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("서버에 저장될 파일명이 생성되었습니다. 파일명 : "+newFileName);
		
		// 2. 저장
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/pfile/"+newFileName);
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

	// 서류파일 수정 요청 폼 서비스
	public HashMap<String, Object> getdocuFileUpdateForm(String Fpidx) {
			
		MemberDTO photoDto = dao.Finddoucment(Fpidx);
		int fpc_idx=photoDto.getFpc_idx();
		MemberDTO dto= dao.FindFpcateName(fpc_idx);
		logger.info("가져온 데이터 : {}", dto);
		
		logger.info("사진데이터 : {}", photoDto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("detail", dto);
		result.put("detailPhoto", photoDto);
		return result;

		

	}
	
	// 서류파일 수정 서비스
	public HashMap<String, Object> memberdocuFileUpdateForm(MultipartFile memPhoto, HashMap<String, String> params) {
		logger.info("받아온 요소 : {}", params);
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(params.get("memId"));
		dto.setFpc_cate(params.get("fpcCate"));
		dto.setFp_idx(Integer.parseInt(params.get("FpIdx")));
		
		dto.setFpc_idx(dao.findFpcidx(dto));

		
		logger.info("추출된 번호:"+dao.findFpcidx(dto));
		
		
		int FpcIdx=dto.getFpc_idx();
		int FcIdx=dto.getFp_idx();
		String memId = dto.getMem_id();

		
		if(memPhoto != null){
			String oriFileName = memPhoto.getOriginalFilename();
			logger.info("첨부된 사진이 있습니다. 사진 명 : "+oriFileName);
			if(oriFileName != null && !oriFileName.equals("")) { //사진 있음
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));// 확장자 추출
				String newFileName = pfileSave(memPhoto,ext);
				logger.info("서버에 저장될 파일 이름 : "+newFileName);
				if(!newFileName.equals("")) {
					dao.PFileUpdate(oriFileName, newFileName,memId,FpcIdx,FcIdx);
				}
			}
		}
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		result.put("memId", memId);
		return result;
	}	
	
}
