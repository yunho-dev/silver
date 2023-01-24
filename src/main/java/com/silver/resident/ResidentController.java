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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResidentController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentService service;
	
	
	@GetMapping(value="/resident")
	public ModelAndView resident(@RequestParam HashMap<String, String> params) {
		logger.info("resident");
		return service.resident(params);
	}
	@GetMapping(value="/residentCategory")
	public ModelAndView residentCategory(@RequestParam HashMap<String, String> params) {
		logger.info("residentCategory");
		return service.residentCategory(params);
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
	/*
	@RequestMapping(value="/residentDateSearch.do")
	public ModelAndView residentDateSearch(@RequestParam HashMap<String, String> params, @RequestParam String re_idx) throws Exception {
		logger.info("residentDateSearch date: "+params.get("date"));	
		logger.info("params:{} ",params);
		logger.info("re_idx "+re_idx);
				
		return service.residentDateSearch(params, re_idx);
	}
	*/
	
	
	
	@GetMapping(value="/roomListCall.go")
	@ResponseBody
	public HashMap<String, Object> roomListCall() {	
		return service.roomListCall();
	}
	
	//상세보기
	@GetMapping(value="/residentdetail.go")
	@ResponseBody
	public HashMap<String, Object> residentdetail(@RequestParam String re_idx) {	
		return service.residentDetail(re_idx);
	}
	@GetMapping(value="/cateDetailDetail.go")
	public String cateDetailDetail(@RequestParam int re_idx, @RequestParam int cc_idx, @RequestParam int cu_num,  Model model) {	
		logger.info("re_idx: "+re_idx);	
		logger.info("cc_idx: "+cc_idx);	
		logger.info("cu_num: "+cu_num);
		String page="";
		if (cc_idx==1 ) {
			service.cateDetailCure(re_idx, cu_num, model, "cateDetailDetailCure");		
			page ="resident/residentCureDetail";
		}
		else if (cc_idx==2 ) {
			service.cateDetaiMedic(re_idx, cu_num, model, "cateDetailDetailMedic");		
			page ="resident/residentMedicDetail";
		}
		else if (cc_idx==3 ) {
			service.cateDetailVital(re_idx, cu_num, model, "cateDetailDetailMedic");		
			page ="resident/residentVitalDetail";
		}
		return page;	
	}

	@GetMapping(value = "/residentCateDetail.do")
	@ResponseBody
	public HashMap<String, Object> residentCateDetail(@RequestParam String re_idx){
		logger.info("관리 이력 리스트 뽑아오기");
		return service.residentCateDetail(re_idx);
	}	
	@GetMapping(value = "/residentDateSearch.do")
	@ResponseBody
	public HashMap<String, Object> residentDateSearch(@RequestParam HashMap<String, String> params) {
		logger.info("관리 이력 리스트 뽑아오기");
		logger.info("params:{} ",params);
		return service.residentDateSearch(params);
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
	public String residentwriteForm(Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		
		return "resident/residentwriteForm";		
	}
	
	

	
	@RequestMapping(value="/residentwrite.do")
	public String residentwrite(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, @RequestParam HashMap<String, String> params) {
		logger.info("params:{} ",params);	
		logger.info("photo_fp_oriFileName: "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		
		return service.residentwrite(photo_fp_oriFileName, fp_oriFileName, params);
	}
	@RequestMapping(value="/residentwriteCure.do")
	public String residentwriteCure(@RequestParam HashMap<String, String> params) {
		logger.info("params:{} ",params);	
		return service.residentwriteCure(params);
	}
	@RequestMapping(value="/residentwriteMedic.do")
	public String residentwriteMedic(@RequestParam HashMap<String, String> params) {
		logger.info("params:{} ",params);	
		return service.residentwriteMedic(params);
	}
	@RequestMapping(value="/residentwriteVital.do")
	public String residentwriteVital(@RequestParam HashMap<String, String> params) {
		logger.info("params:{} ",params);	
		return service.residentwriteVital(params);
	}
	

	
	@RequestMapping(value="/residentupdateForm.go")
	public String updateForm(@RequestParam String re_idx, Model model) {
		logger.info("residentupdateForm idx : "+re_idx);
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		service.residentdetail(re_idx, model,"resident/residentupdateForm");		
		return "resident/residentupdateForm";
	}
	@RequestMapping(value="/residentCure.go")
	public String residentCure(@RequestParam String re_idx, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		logger.info("residentCure idx : "+re_idx);
		service.residentdetail(re_idx, model,"resident/residentCure");	
		return "resident/residentCure";		
	}	
	@RequestMapping(value="/residentMedic.go")
	public String residentMedic(@RequestParam String re_idx, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		logger.info("residentMedic idx : "+re_idx);
		service.residentdetail(re_idx, model,"resident/residentMedic");
		return "resident/residentMedic";		
	}
	@RequestMapping(value="/residentVital.go")
	public String residentVital(@RequestParam String re_idx, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("page", "resident");
		
		model.addAttribute("page", map);
		logger.info("residentVital idx : "+re_idx);
		service.residentdetail(re_idx, model,"resident/residentVital");
		return "resident/residentVital";		
	}
		
	
	
	@RequestMapping(value="/residentupdate.do")
	public String residentupdate(MultipartFile photo_fp_oriFileName, MultipartFile[] fp_oriFileName, @RequestParam HashMap<String, String> params) {
		logger.info("residentupdate params:{} ",params);		
		logger.info("photo_fp_oriFileName: "+photo_fp_oriFileName.getOriginalFilename());
		logger.info("photo_fp_oriFileName: "+fp_oriFileName);
		return service.residentupdate(photo_fp_oriFileName, fp_oriFileName, params);
	}
	@RequestMapping(value="/residentUpdatedetail.do")
	public String residentUpdatedetail(@RequestParam HashMap<String, String> params) {
		logger.info("residentUpdateCure params:{} ",params);	
		String page="";
		try {
			
			int cc_idx =  Integer.parseInt(params.get("cc_idx"));
			logger.info("cc_idx "+cc_idx);	
			if (cc_idx==1 ) {
				logger.info("cateUpdateCure");
				page =service.cateUpdateCure(params);	
			}
			else if (cc_idx==2 ) {
				logger.info("cateUpdateMedic");
				page =service.cateUpdateMedic(params);		
			}
			else if (cc_idx==3 ) {
				logger.info("cateUpdatelVital");
				page =service.cateUpdateVital(params);	
			}
		} catch (Exception e) {
			
		}
		
		return page;	
	}

		
		
	
}
