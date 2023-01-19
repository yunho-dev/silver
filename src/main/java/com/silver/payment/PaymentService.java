package com.silver.payment;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.silver.alarm.AlarmService;
import com.silver.member.MemberDTO;

@Service
public class PaymentService {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired AlarmService alservice;
	
	private final PaymentDAO paymentdao;
	
	public PaymentService(PaymentDAO paymentdao) {
		this.paymentdao=paymentdao;
	}

	public ArrayList<PaymentDTO> MyPayListCall(HttpServletRequest request, int page) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
				
	
		return paymentdao.MyPayListCall(mem_id,page);
	}

	public int MyPayListCallTotal(HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		
		return paymentdao.MyPayListCallTotal(mem_id);
	}

	public ArrayList<PayFormDTO> modalPayFormList(String payFormDropDown) {
		return paymentdao.modalPayFormList(payFormDropDown);
	}

	public ArrayList<PaymentDTO> PayMentReferCho_ajax() {
		return paymentdao.PayMentReferCho_ajax();
	}

	public ArrayList<PaymentDTO> referDept() {
		return paymentdao.referDept();
	}

	public ArrayList<PaymentDTO> PayOrgCall(int selfMem_Pos) {
		return paymentdao.PayOrgCall(selfMem_Pos);
	}

	public ModelAndView PayMentInsert_do(MultipartFile[] payMentFile, MultipartFile[] payMentFile2, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("payment/selfPayment");
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		PaymentDTO PayDto=new PaymentDTO();
		PayDto.setPm_open(1);
		if(request.getParameter("openchk") == null) {
			PayDto.setPm_open(0);
		}
		PayDto.setPm_dept(memberDTO.getDept_name());
		PayDto.setMem_id(memberDTO.getMem_id());
		PayDto.setPm_bigo(request.getParameter("bigoContent"));
		PayDto.setPm_subject(request.getParameter("PaymentSubject"));
		PayDto.setPf_idx(Integer.parseInt(request.getParameter("chk_info")));
		PayDto.setPm_content(request.getParameter("wp_content"));
		
		int row=paymentdao.PayMentInsert_First(PayDto);
		int pm_idx=PayDto.getPm_idx();
		if (row > 0) {
			PmLineInsert(request.getParameter("OrgPmSelected"),pm_idx);
			//if(PayDto.getPm_open() == 1) {
				InsertPayRefer(request, pm_idx,request.getParameter("ReferinsertInput"),PayDto.getPm_open());
			//}
			if(!payMentFile[0].getOriginalFilename().isEmpty()) {
				PayMentFileUpload(payMentFile,pm_idx);
			}
		}
		
		if(request.getParameter("payFormDropDown").equals("휴가")) {
			Timestamp FirstTime=Timestamp.valueOf(request.getParameter("FirstVacationDate")+" 00:00:00");
			PayDto.setHo_type(request.getParameter("vacationDrop"));
			PayDto.setHo_start(FirstTime);
			if(request.getParameter("vacationDrop").equals("오전 반차")) {
				Timestamp SecondTime_One=Timestamp.valueOf(request.getParameter("FirstVacationDate")+" 14:00:00");
				PayDto.setHo_end(SecondTime_One);
			}else if(request.getParameter("vacationDrop").equals("오후 반차")) {
				FirstTime=Timestamp.valueOf(request.getParameter("FirstVacationDate")+" 14:00:00");
				Timestamp SecondTime_Two=Timestamp.valueOf(request.getParameter("FirstVacationDate")+" 18:00:00");
				PayDto.setHo_start(FirstTime);
				PayDto.setHo_end(SecondTime_Two);
			}else {
				Timestamp SecondTime=Timestamp.valueOf(request.getParameter("SecondVacationDate")+" 18:00:00");
				PayDto.setHo_end(SecondTime);
			}
			paymentdao.PayMentHoli(PayDto);
			
		}
		return mav;
	}


	private void PayMentFileUpload(MultipartFile[] payMentFile, int pm_idx) {
		for (MultipartFile mfile : payMentFile) {
			try {
				OneUpload(mfile,pm_idx);
				Thread.sleep(1);
			} catch (InterruptedException e) {
			}
		}
		
	}

	private void OneUpload(MultipartFile mfile, int pm_idx) {
		String oriFileName=mfile.getOriginalFilename();
		logger.info("oriFileName : "+oriFileName);
		String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
		
		// 2. 새파일명 생성
		String newFileName=System.currentTimeMillis()+ext;
	
		try {
			byte[] arr = mfile.getBytes();
			// 저장할 파일 위치 지정
			Path path=Paths.get("C:/pfile/"+newFileName);
			// 파일 쓰기
			Files.write(path, arr);
			paymentdao.FileUpload(pm_idx,oriFileName,newFileName);
		} catch (IOException e) {
		}
		
	}
	
	private void PmLineInsert(String line, int pm_idx) {
		String[] Rm_arr=line.split(",");
		ArrayList<String> lineSame=new ArrayList<String>();
		for (int i = 0; i < Rm_arr.length; i++) {
			lineSame.add(Rm_arr[i]);
		}
		ArrayList<String> resultList=new ArrayList<String>();
		for (String str : lineSame) {
			if(!resultList.contains(str)) {
				resultList.add(str);
			}
		}
		for (String res : resultList) {
			String getDept=paymentdao.GetDept(res);
			paymentdao.insertLine(getDept,res,pm_idx);
		}
		logger.info("중복 제거 결재 라인"+resultList.toString());

		
		// ArrayList<PaymentDTO> PmLine=paymentdao.PmLine(line);
	}

	private void InsertPayRefer(HttpServletRequest request, int pm_idx, String Refer, int teamopen) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String DeptName=memberDTO.getDept_name();
		ArrayList<String> TeamMember=new ArrayList<String>();
		ArrayList<String> resultList=new ArrayList<String>();
		String[] Refer_arr=null;
		if(teamopen == 1) {
			TeamMember=paymentdao.TeamMember(DeptName);
			Refer_arr=Refer.split(",");
			for (int i = 0; i < Refer_arr.length; i++) {
				TeamMember.add(Refer_arr[i]);
			}
			
			for (String str : TeamMember) {
				if(!resultList.contains(str)) {
					resultList.add(str);
				}
			}
		}else {
			Refer_arr=Refer.split(",");
			for (int i = 0; i < Refer_arr.length; i++) {
				resultList.add(Refer_arr[i]);
			}
		}
		
		
		PaymentDTO paymentdto=new PaymentDTO();
		paymentdto.setPm_idx(pm_idx);
		logger.info("PM IDX Getter 값 : "+paymentdto.getPm_idx());
		paymentdto.setResultList(resultList);
		paymentdao.AddRefer(paymentdto);
		
	}

	public ModelAndView detailPayment_do(int pm_idx, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("payment/detailPayment");
		PaymentDTO PayDto=paymentdao.detailPayment_do(pm_idx);
		ArrayList<PaymentDTO> ReferDto=paymentdao.ReferDto(pm_idx);
		ArrayList<PaymentDTO> PmlineDto=paymentdao.PmlineDto(pm_idx);
		ArrayList<PaymentDTO> PayFile=paymentdao.PayFile(pm_idx);
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		String SignImg=paymentdao.SignImg(mem_id);
		mav.addObject("PayDto",PayDto);
		mav.addObject("ReferDto",ReferDto);
		mav.addObject("PayFile",PayFile);
		mav.addObject("PmlineDto",PmlineDto);
		mav.addObject("SessionID",mem_id);
		mav.addObject("SignImg",SignImg);
		return mav;
	}

	public int MySangSin(PaymentDTO payDto) {
		int row = paymentdao.MySangSin(payDto);
		if(row > 0) {
			String NextChk= FirstPmLineCall(payDto.getPm_idx());
			if(NextChk.isEmpty()) {
				row=2; // 결재자 미지정 후 결재 등록 했을 때
			}else {
				alservice.notiAlarm(payDto.getMem_name(), payDto.getPm_idx(), "결재 문서", NextChk);
			}
		}
		return row;
	}

	private String FirstPmLineCall(int pm_idx) {
		String WhoFirst = paymentdao.WhoFirst(pm_idx);
		return WhoFirst;
	}

	public String MySign(PaymentDTO payDto) {
		String MySign = paymentdao.MySign(payDto.getMem_id());
		return MySign;
	}


	public ArrayList<PaymentDTO> openpayment_ajax(HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		ArrayList<String> referPmIdx=paymentdao.referPmIdx(mem_id);
		Collections.reverse(referPmIdx);
		ArrayList<PaymentDTO> openPayment=new ArrayList<PaymentDTO>();

		for (String str : referPmIdx) {
			logger.info("str : "+str);
			openPayment.addAll(paymentdao.openPayment(str));
		}
		
		
		for (PaymentDTO open : openPayment) {
			logger.info("open : "+open.getPm_subject());
		}
		
		return openPayment;
	}

//	public ArrayList<PaymentDTO> FirstWaitPayment(HttpServletRequest request) {
//		HttpSession session=request.getSession();
//		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
//		String mem_id=memberDTO.getMem_id();
//		return paymentdao.FirstWaitPayment(mem_id);
//	}

	public ArrayList<PaymentDTO> SecondWaitPayment(HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("loginId");
		String mem_id=memberDTO.getMem_id();
		int mem_posLevel=memberDTO.getPos_level()+1;
		ArrayList<PaymentDTO> WaitPmLine=paymentdao.WaitPm(mem_id,mem_posLevel);
		
		return WaitPmLine;
	}

	public void PmSangSin(PaymentDTO payDto) {
		String writePayMent=paymentdao.writePayMent(payDto);
		if(payDto.getPm_state().equals("상신")) {
			// 상신 하기
			paymentdao.GoPayment(payDto); // 비고란 수정 
			paymentdao.PmChange(payDto); // 결재라인 수정 
			String isNext="";
			isNext=paymentdao.isNext(payDto); // 최종결재자인지 확인
			logger.info("최종 결재자 확인 + "+isNext);
			logger.info("최종 결재자 확인1 + "+payDto.getPl_hp());
			if(isNext == null) {
				// 최종 결재자일 경우
				logger.info("최종 결재자 입니다.");
				int finish = paymentdao.FinishPayment(payDto);
				if(finish > 0) {
					logger.info("finish 완료");
					ArrayList<String> FinishAlarmSearch=paymentdao.FinishAlarmSearch(payDto);
					for (String str : FinishAlarmSearch) {
						logger.info("최종 결재 알람 수신 멤버 : "+str);
						// 최종 결재 알람 전송
						alservice.notiAlarm(writePayMent, payDto.getPm_idx(), "결재 완료", str);
					}
					// 문서 양식 사용 수 증가
					paymentdao.PayFormUpCnt(payDto);
				}
			}else {
				// 다음 결재자가 있을때 알람 전송
				alservice.notiAlarm(writePayMent, payDto.getPm_idx(), "결재 진행", isNext);
			}
		}else if(payDto.getPm_state().equals("반려")) {
			paymentdao.GoPayment(payDto); // 비고란 수정 
			paymentdao.PmBackChange(payDto); // 결재라인 수정
//			String isNext=""; //
//			isNext=paymentdao.isNext(payDto); // 최종결재자인지 확인
//			if(isNext == null) {
//				logger.info("최종 결재 반려자 입니다.");
				int finish = paymentdao.FinishBackPayment(payDto);
				if(finish > 0) {
					// 문서 반려 완료
					ArrayList<String> FinishAlarmSearch=paymentdao.FinishBackAlarmSearch(payDto);
					for (String str : FinishAlarmSearch) {
						logger.info("최종 반려 알람 수신 멤버 : "+str);
						// 최종 반려 알람 전송
						alservice.notiAlarm(writePayMent, payDto.getPm_idx(), "결재 반려", str);
					}
//				}else {
//					
//				}
				
			}
		}
		
	}
	

	


}
