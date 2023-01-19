package com.silver.resident;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResidentController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentService service;
	
	
	@GetMapping(value="/resident")
	public ModelAndView resident() {
		logger.info("resident");
		return service.resident();
	}
	@GetMapping(value="/residentCategory")
	public ModelAndView residentCategory() {
		logger.info("residentCategory");
		return service.residentCategory();
	}
	
	
	@RequestMapping(value="/residentsearch.do")
	public ModelAndView residentSearch(@RequestParam HashMap<String, String> params) throws Exception {
		logger.info("residentsearch re_state: "+params.get("re_state"));	
		logger.info("residentsearch re_name: "+params.get("re_name"));	
		logger.info("params:{} ",params);
				
		return service.residentsearch(params);
	}
	@RequestMapping(value="/residentCateSearch.do")
	public ModelAndView residentCateSearch(@RequestParam HashMap<String, String> params) throws Exception {
		logger.info("residentCateSearch re_name: "+params.get("re_name"));	
		logger.info("params:{} ",params);
		return service.residentCateSearch(params);
	}
	
	
	//상세보기
	@GetMapping(value="/residentdetail.go")
	public String residentdetail(@RequestParam String re_idx, Model model) {	
		logger.info("residentdetail re_idx: ",re_idx);
		service.residentdetail(re_idx, model,"residentdetail");		
		return "resident/residentdetail";
	}
	@GetMapping(value="/residentCateDetail.go")
	public String residentCateDetail(@RequestParam String re_idx, Model model) {	
		logger.info("residentCateDetail re_idx: ",re_idx);
		service.residentCateDetail(re_idx, model,"residentCateDetail");		
		return "resident/residentCateDetail";
	}	
	// 첨부파일 다운로드
	@GetMapping(value="/resifileDownload.do")
	public ResponseEntity<Resource> download(String path){
		logger.info("photo name: "+path);
		String filePath ="/filephoto/"+path;
		String fp_newFileName =path;
		
		Resource resource = new FileSystemResource(filePath);		
		HttpHeaders header = new HttpHeaders();
		
		
		try {
			// 한글 파일명은 다운로드시 이름이 깨져서 표현된다
			// 한끌 깨짐 방지가 필요하다
			String encodeName;			
			encodeName = URLEncoder.encode(fp_newFileName, "UTF-8");
			logger.info("encoded: "+encodeName);
			
			// image/ ...은 이미지, text/ ... 은 문자열, application/octet-stream 은 바이너리
			header.add("Content-type","application/octet-stream");			
			// Content-Disposition 은 내려보낼 대 문자열인지(inline) 인지 다운로드 받을 파일(attachment) 인지 데이터 종류를 의미
			//fileName="과제.gif" 형태로 이름을 지정하지 않으면 다운로드 되지 않는다
			header.add("Content-Disposition", "application;fileName=\""+encodeName+"\"");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value="/residentwriteForm.go")
	public String residentwriteForm() {
		return "resident/residentwriteForm";		
	}

	
	@RequestMapping(value="/residentwrite.do")
	public String residentwrite(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, @RequestParam HashMap<String, String> params) {
		logger.info("params:{} ",params);	
		logger.info("photo_fp_oriFileName: "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		
		return service.residentwrite(photo_fp_oriFileName, fp_oriFileName, params);
	}


	@RequestMapping(value="/residentupdateForm.go")
	public String updateForm(@RequestParam String re_idx, Model model) {
		logger.info("residentupdateForm idx : "+re_idx);
		service.residentdetail(re_idx, model,"resident/residentupdateForm");		
		return "resident/residentupdateForm";
	}
	
	
	@RequestMapping(value="/residentupdate.do")
	public String residentupdate(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, @RequestParam HashMap<String, String> params) {
		logger.info("residentupdate params:{} ",params);		
		logger.info("photo_fp_oriFileName: "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		return service.residentupdate(photo_fp_oriFileName, fp_oriFileName, params);
	}
	
}
