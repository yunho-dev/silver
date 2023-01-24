package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.silver.boardnext.NextDTO;

@Controller
public class ResdientProgramController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ResidentProgramService residientprogramservice;
	
	//프로그램 리스트 페이지 이동
	@GetMapping(value="/programList")
	public String residentProgramGategory(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("입소자 프로그램 조회");
		
		logger.info("세션 값 조회");
		logger.info("params:{}",params);
		model.addAttribute("page", params);
		
		return "resident/programList";
	}

// 리스트 ajax처리함
//	@RequestMapping(value="/ProgramlistCall")
//	@ResponseBody
//	public HashMap<String, Object> ProgramlistCall(){
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		logger.info("프로그램 리스트콜 start");
//		ArrayList<ResidentProgramDTO> programlist = residientprogramservice.programlist();
//		logger.info("프로그램 리스트콜 ing");
//		map.put("programlist", programlist);
//		
//		return map;
//		
//	}
	//프로그램 작성페이지 이동
	@GetMapping(value="/programWrite")
	public ModelAndView programWrite(@RequestParam HashMap<String, String> params) {
		//여기서 @RequestParam HashMap<String, String> params해준것은 카테고리 색때문에
		
		return residientprogramservice.programWrite(params);
		//return "resident/programWrite"; 
	}
	
	//프로그램 작성
	@PostMapping(value="/ProgramWriteComplete")
	public ModelAndView ProgramWriteComplete(HttpServletRequest req,String pr_name, String pr_teacher,
			String pr_start, String pr_end,String pr_goal, String pr_content, String pr_place, String pr_state,int pc_idx) {
//		logger.info("번호:"+dto.getPr_idx());
//		logger.info("이름:"+dto.getPr_name());
//		logger.info("선생:"+dto.getPr_teacher());
//		logger.info("시작:"+dto.getPr_start());
//		logger.info("끄읕:"+dto.getPr_end());
//		logger.info("내용:"+dto.getPr_content());
//		logger.info("목표:"+dto.getPr_goal());
//		logger.info("장소:"+dto.getPr_place());
//		logger.info("상태:"+dto.getPr_state());
//		logger.info("카테고리:"+dto.getPc_idx());
		
		
		return residientprogramservice.ProgramWriteComplete(req,pr_name,pr_teacher,pr_start,pr_end,pr_goal,pr_content,pr_place,pr_state,pc_idx);
	}
	
	//프로그램 상세보기
	@GetMapping(value="/programDetail")
	public ModelAndView programDetai(@RequestParam String pr_idx,@RequestParam HashMap<String, String>params) {
		
		logger.info("프로그램디테일컨트롤러:"+pr_idx);
		
		return residientprogramservice.programDetail(pr_idx,params);
	}
	
	//프로그램 수정
	@PostMapping(value="/programDetailUpdate")
	public ModelAndView programDetailUpdate(HttpServletRequest req) {
		
		logger.info("업데이트 번호:"+req.getParameter("pr_idx"));
		logger.info("업데이트 이름:"+req.getParameter("pr_name"));
		logger.info("업데이트 강사:"+req.getParameter("pr_teacher"));
		logger.info("업데이트 시작:"+req.getParameter("pr_start"));
		logger.info("업데이트 끝:"+req.getParameter("pr_end"));
		logger.info("업데이트 목표:"+req.getParameter("pr_goal"));
		logger.info("업데이트 내용:"+req.getParameter("pr_content"));
		logger.info("업데이트 장소:"+req.getParameter("pr_place"));
		logger.info("업데이트 상태:"+req.getParameter("pr_state"));
		logger.info("업데이트 카테고리:"+req.getParameter("pc_idx"));
//		logger.info("업데이트 카테고리 순번:"+req.getParameter("pc_idxTwo"));
		
		
		return residientprogramservice.programDetailUpdate(req);
		
	}
	
	//프로그램 리스트 가져오기(페이징)
	@GetMapping(value="/ProgramListCall.ajax")
	@ResponseBody
	public HashMap<String, Object> ProgramListCall(HttpServletRequest request,@RequestParam int page) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		int total=residientprogramservice.residientprogramSizeTotal();
		int page_idx=total/10 > 0 ? total%10 == 0? (total/10) : (total/10)+1 : 1;
		page=(page-1)*10;
		ArrayList<ResidentProgramDTO> list=residientprogramservice.listCall(page);
//		HttpSession session=request.getSession();
//		MemberDTO sessionDTO=(MemberDTO) session.getAttribute("loginId");
//		int pos=sessionDTO.getPos_level();
//		logger.info("mem_id 값 : "+sessionDTO.getMem_id());
//		logger.info("pos 값 : "+pos);
		map.put("list", list);
		map.put("page_idx", page_idx);
//		map.put("sessionLevel", pos);
//		map.put("SessionID", sessionDTO.getMem_id());
		return map;
	}

	
	
	
	
}
