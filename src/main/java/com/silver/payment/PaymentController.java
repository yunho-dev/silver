package com.silver.payment;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.silver.member.MemberDTO;

@Controller
public class PaymentController {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final PaymentService paymentservice;
	
	public PaymentController(PaymentService paymentservice) {
		this.paymentservice=paymentservice;
	}
	
	
	@GetMapping(value="/selfPayment")
	public String selfPayment_go(Model model,@RequestParam HashMap<String, String> params){
		model.addAttribute("page",params);
		return "payment/selfPayment";
	}
	
	@ResponseBody
	@GetMapping(value="/selfpayment.ajax")
	public HashMap<String, Object> selfpayment_ajax(HttpServletRequest request,@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=paymentservice.MyPayListCallTotal(request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> paymentList=paymentservice.MyPayListCall(request,page);
		map.put("paymentList", paymentList);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@GetMapping(value="/paymentwrite.go")
	public String paymentwrite_go(HttpServletRequest request,Model model,
			@RequestParam HashMap<String, String> params) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_name=memberDTO.getMem_name();
		int mem_posLevel=memberDTO.getPos_level();
		logger.info("pos 레벨 : "+mem_posLevel);
		model.addAttribute("page",params);
		model.addAttribute("SelfMem_name",mem_name);
		model.addAttribute("mem_posLevel",mem_posLevel);
		return "payment/writePayment";
	}
	
	@ResponseBody
	@GetMapping(value="/WritePayformCall.ajax")
	public HashMap<String, Object> WritePayformCall_ajax(@RequestParam String payFormDropDown){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PayFormDTO> modalPayFormList=paymentservice.modalPayFormList(payFormDropDown);
		map.put("modalPayFormList", modalPayFormList);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/PayMentReferCho.ajax")
	public HashMap<String, Object> PayMentReferCho_ajax(){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PaymentDTO> refercho=paymentservice.PayMentReferCho_ajax();
		ArrayList<PaymentDTO> referDept=paymentservice.referDept();
		map.put("refercho", refercho);
		map.put("referDept", referDept);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/PayOrgCall.ajax")
	public HashMap<String, Object> PayOrgCall_ajax(@RequestParam int SelfMem_Pos){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("SelfMem_Pos"+SelfMem_Pos);
		ArrayList<PaymentDTO> PayOrgCall=paymentservice.PayOrgCall(SelfMem_Pos);
		ArrayList<PaymentDTO> OrgDept=paymentservice.referDept();
		map.put("PayOrgCall", PayOrgCall);
		map.put("OrgDept", OrgDept);
		return map;
	}
	
	@PostMapping(value="/PayMentInsert.do")
	public ModelAndView PayMentInsert_do(MultipartFile[] PayMentFile,HttpServletRequest request
			,@RequestParam HashMap<String,String > params) {
		logger.info("결재 양식"+request.getParameter("payFormDropDown"));
		logger.info("결재 양식 순번"+request.getParameter("chk_info"));
		logger.info("휴가 종류"+request.getParameter("vacationDrop"));
		logger.info("휴가 시작 날짜"+request.getParameter("FirstVacationDate"));
		logger.info("휴가 끝 날짜"+request.getParameter("SecondVacationDate"));
		logger.info("팀 오픈"+request.getParameter("openchk"));
		logger.info("참조자"+request.getParameter("ReferinsertInput"));
		logger.info("내용"+request.getParameter("wp_content"));
		logger.info("결재 라인"+request.getParameter("OrgPmSelected"));
		logger.info("의견 란"+request.getParameter("bigoContent"));
		logger.info("결재 라인 버전2 : "+request.getParameter("OrgRadio"));
		
		return paymentservice.PayMentInsert_do(PayMentFile,request,params);
	}
	
	@GetMapping(value="/detailPayment.do")
	public ModelAndView detailPayment_do(@RequestParam int pm_idx,HttpServletRequest request
			,@RequestParam HashMap<String, String> params) {
		
		return paymentservice.detailPayment_do(pm_idx,request,params);
	}
	
	@GetMapping(value="/download.do")
	public ResponseEntity<Resource> download(@RequestParam String path){
		logger.info("photo name : "+path);
		String filePath="/usr/local/tomcat/webapps/silver/pfile/"+path;
		String oriFileName=paymentservice.getDownloadOrlName(path);
		
		Resource resource=new FileSystemResource(filePath);
		HttpHeaders header = new HttpHeaders();
		
		// 한글 파일며은 다운로드시 이름이 깨져서 표현된다.
		// 한글깨짐 방지가 필요 하다.
		String encodeName;
		try {
			encodeName = URLEncoder.encode(oriFileName,"utf-8");
			logger.info("encoded : "+encodeName);
			// image/... 은 이미지, text/... 은 문자열, application.octet-stream 은 바이너리
			header.add("Content-type", "application/octet-stream");
			// content-Disposition 은 내려보낼때 문자열(inline)인지 다운로드 받을 파일(attachment)인지 데이터 종류를 의미
			// fileName="과제.gif" 형태로 이름을 저장하지 않으면 다운로드가 되지 않는다.
			header.add("content-Disposition", "attachment;fileName=\""+encodeName+"\"");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	}
	
	
	
	@ResponseBody
	@PostMapping(value="/MySangSin.ajax")
	public HashMap<String, Object> MySangSin_ajax(@RequestBody PaymentDTO payDto){
		HashMap<String,Object> map=new HashMap<String, Object>();
		logger.info("idx 값은 : "+payDto.getPm_idx());
		logger.info("mem_id 값은 : "+payDto.getMem_id());
		int success= paymentservice.MySangSin(payDto);
		if(success == 1) {
			String MySign= paymentservice.MySign(payDto);
			map.put("MySign", MySign);
		}else if(success == 2) {
			map.put("NonNext", "결재자가 없습니다. 문서 작성 다시 부탁드립니다.");
		}
		map.put("success", success);
		return map;
	}
	
	
	
	@GetMapping(value="/openPayment")
	public String referPayment_go(HttpServletRequest request,Model model,@RequestParam HashMap<String, String> params) {
		model.addAttribute("page",params);
		return "payment/openPayment";
	}
	
	// 열람 가능 문서 함
	@ResponseBody
	@GetMapping(value="/openpayment.ajax")
	public HashMap<String, Object> openpayment_ajax(@RequestParam int page,HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=paymentservice.OpensListCallTotal(request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> openList=paymentservice.openpayment_ajax(page,request);
		map.put("openList", openList);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/OpenSearch.ajax")
	public HashMap<String, Object> OpenSearch_ajax(@RequestParam String select, @RequestParam String seacontent
			,@RequestParam int page,HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=paymentservice.OpensListCallSearchTotal(select,seacontent,request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> openListSearch=paymentservice.openpaymentSearch_ajax(select,seacontent,page,request);
		map.put("openListSearch", openListSearch);
		map.put("page_idx", page_idx);
		return map;
	}
	
	
	@GetMapping(value="/waitPayment")
	public String waitPayment_go(Model model,@RequestParam HashMap<String, String> params) {
		model.addAttribute("page",params);
		return "/payment/waitPayment";
	}
	
	// 결재 대기 문서함
	@ResponseBody
	@GetMapping(value="/waitpayment.ajax")
	public HashMap<String, Object> waitpayment_ajax(HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PaymentDTO> WaitPayment = paymentservice.WaitPayment();
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		map.put("wait", WaitPayment);
		map.put("mem_id", mem_id);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/PmSangSin.ajax")
	public HashMap<String, Object> PmSangSin_ajax(@RequestBody PaymentDTO payDto){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("PMSangSin IDX : "+payDto.getPm_idx());
		logger.info("PMSangSin mem_id : "+payDto.getMem_id());
		logger.info("PMSangSin mem_name : "+payDto.getMem_name());
		logger.info("PMSangSin pm_state : "+payDto.getPm_state());
		logger.info("PMSangSin pm_bigo : "+payDto.getPm_bigo());
		paymentservice.PmSangSin(payDto);
		if(payDto.getPm_state().equals("상신")) {
		String MySign= paymentservice.MySign(payDto);
		map.put("MySignGo", MySign);
		} else if(payDto.getPm_state().equals("반려")) {
			map.put("MySignBack", "반려");
		}
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/DetailPaymentListCall.ajax")
	public HashMap<String, Object> DetailPaymentListCall_ajax(@RequestParam int pm_idx
			,@RequestParam String mem_id){
		HashMap<String, Object> map=new HashMap<String, Object>();
		logger.info("DetailPayment pm_idx : "+pm_idx);
		logger.info("DetailPayment mem_id : "+mem_id);
		String MySign= paymentservice.MyWriteSign(mem_id);
		logger.info("MySign : "+MySign);
		ArrayList<String> pl_hp=paymentservice.pl_hp(pm_idx);
		if(!pl_hp.isEmpty()) {
			logger.info("pl_hp : "+pl_hp.toString());
			ArrayList<PaymentDTO> AnotherSign = paymentservice.AnotherSign(pl_hp);
			ArrayList<PaymentDTO> PmlineDto=paymentservice.PmlineDto(pm_idx);
			for (PaymentDTO DTO : AnotherSign) {
				logger.info("AnotherSign file : "+DTO.getSi_newFileName());
				logger.info("AnotherSign mem : "+DTO.getMem_id());
			}
			map.put("AnotherSign", AnotherSign);
			map.put("line", PmlineDto);
		}
		map.put("MySign", MySign);
		return map;
	}
	
	@GetMapping(value="/goingPayment")
	public String goingPayment_go(Model model,@RequestParam HashMap<String, String> params){
		model.addAttribute("page", params);
		return "payment/goingPayment";
	}
	
	// 진행 중 결재 리스트 출력
	@ResponseBody
	@GetMapping(value="/goingpayment.ajax")
	public HashMap<String, Object> goingpayment_ajax(HttpServletRequest request,@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=paymentservice.goingpaymentTotal_ajax(request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> goingpayment=paymentservice.goingpayment_ajax(request,page);
		map.put("goingpayment", goingpayment);
		map.put("page_idx", page_idx);
		return map;
	}
	
	@GetMapping(value="/finishPayment")
	public String finishPayment_go(Model model,@RequestParam HashMap<String, String> params){
		model.addAttribute("page", params);
		return "payment/finishPayment";
	}
	
	// 완료 및 반려 결재 리스트 
	@ResponseBody
	@GetMapping(value="/finishpayment.ajax")
	public HashMap<String, Object> finishpayment(HttpServletRequest request,@RequestParam int page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=paymentservice.finishpaymentTotal_ajax(request);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> finishpayment=paymentservice.finishpayment_ajax(request,page);
		map.put("finishpayment", finishpayment);
		map.put("page_idx", page_idx);
		return map;
	}
	
	// 개인 결재함 검색
	@ResponseBody
	@GetMapping(value="/selfSearch.ajax")
	public HashMap<String, Object> selfSearch_ajax(HttpServletRequest request
			,@RequestParam String select, @RequestParam String seacontent
			,@RequestParam int page){
		HashMap<String,Object> map=new HashMap<String, Object>();
		int total=paymentservice.selfSearchTotal(request,select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> selfSearch=paymentservice.selfSearch(request,select,seacontent,page);
		map.put("page_idx", page_idx);
		map.put("list", selfSearch);
		return map;
	}
	
	// 진행 결재함 검색 
	@ResponseBody
	@GetMapping(value="/goingSearch.ajax")
	public HashMap<String, Object> goingSearch_ajax(HttpServletRequest request
			,@RequestParam String select, @RequestParam String seacontent
			,@RequestParam int page){
		HashMap<String,Object> map=new HashMap<String, Object>();
		int total=paymentservice.goingSearchTotal(request,select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> goingSearch=paymentservice.goingSearch(request,select,seacontent,page);
		map.put("page_idx", page_idx);
		map.put("list", goingSearch);
		return map;
	}
	
	// 완료 결재함 검색
	@ResponseBody
	@GetMapping(value="/finishSearch.ajax")
	public HashMap<String, Object> finishSearch_ajax(HttpServletRequest request
			,@RequestParam String select, @RequestParam String seacontent
			,@RequestParam int page){
		HashMap<String,Object> map=new HashMap<String, Object>();
		int total=paymentservice.finishSearchTotal(request,select,seacontent);
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<PaymentDTO> finishSearch=paymentservice.finishgoingSearch(request,select,seacontent,page);
		map.put("page_idx", page_idx);
		map.put("list", finishSearch);
		return map;
	}
	
	
	
}
