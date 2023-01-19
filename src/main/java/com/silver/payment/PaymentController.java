package com.silver.payment;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	public String selfPayment_go(){
		
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
	public String paymentwrite_go(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_name=memberDTO.getMem_name();
		int mem_posLevel=memberDTO.getPos_level();
		logger.info("pos 레벨 : "+mem_posLevel);
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
	public ModelAndView PayMentInsert_do(MultipartFile[] PayMentFile,HttpServletRequest request) {
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
		
		return paymentservice.PayMentInsert_do(PayMentFile,PayMentFile,request);
	}
	
	@GetMapping(value="/detailPayment.do")
	public ModelAndView detailPayment_do(@RequestParam int pm_idx,HttpServletRequest request) {
		
		return paymentservice.detailPayment_do(pm_idx,request);
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
	public String referPayment_go(HttpServletRequest request) {
		return "payment/openPayment";
	}
	
	@ResponseBody
	@GetMapping(value="/openpayment.ajax")
	public HashMap<String, Object> openpayment_ajax(@RequestParam int page,HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<PaymentDTO> openList=paymentservice.openpayment_ajax(request);
		map.put("openList", openList);
		return map;
	}
	
	@GetMapping(value="/waitPayment")
	public String waitPayment_go() {
		return "/payment/waitPayment";
	}
	
	@ResponseBody
	@GetMapping(value="/waitpayment.ajax")
	public HashMap<String, Object> waitpayment_ajax(@RequestParam int page,HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		// ArrayList<PaymentDTO> FirstWaitPayment= paymentservice.FirstWaitPayment(request);
//		for (PaymentDTO paymentDTO : FirstWaitPayment) {
//			logger.info("paymentDTO"+paymentDTO.getPm_idx());
//		}
		ArrayList<PaymentDTO> SecondWaitPayment = paymentservice.SecondWaitPayment(request);
//		map.put("first", FirstWaitPayment);
		map.put("sec", SecondWaitPayment);
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
	public HashMap<String, Object> DetailPaymentListCall_ajax(@RequestParam int pm_idx,@RequestParam String mem_id){
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
	public String goingPayment_go(){
		
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
	
	
	
	
}
