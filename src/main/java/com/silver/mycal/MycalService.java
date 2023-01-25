package com.silver.mycal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.silver.member.MemberDTO;

@Service
public class MycalService {
	
	@Autowired MycalDAO dao;
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	// 캘린더 이동 서비스
	public MycalDTO myfind(MemberDTO loginId) {
		logger.info("캘린더에 내 아이디 삽입하는 서비스");
		logger.info("loginId:"+loginId);
		
		return dao.myfind(loginId);
	}
	
	// 캘린더 일정 가져오기 서비스 
	public HashMap<String, Object> MycalListCall(HashMap<String, String> params) {
		logger.info("캘린더 리스트 가져오기 서비스");
		logger.info("parmas:"+params);
		
		ArrayList<MycalDTO> mycalList=dao.MycalListCall(params);
		
	
		logger.info("가져온 일정 리스트:{}",mycalList);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", mycalList);
		
		return result;
	}

	public  HashMap<String, Object> SaveMycalList(HashMap<String, Object> list) throws JsonMappingException, JsonProcessingException {
		logger.info("스케줄 리스트 서비스");
		logger.info("list:{}",list);

		String json = list.get("data").toString();
	      ObjectMapper mapper = new ObjectMapper();
	      List<Map<String, Object>> jsondata = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
	      logger.info("mapper:"+mapper);
	      logger.info("json:"+json);
	      logger.info("jsondata"+jsondata);
	      logger.info("jsondata.size:"+jsondata.size());
	      
	      String mem_id= list.get("memId").toString();
	      logger.info("mem_id:"+mem_id);
	      MycalDTO dto= new MycalDTO();
	      dto.setMem_id(mem_id);
	      
	      int raw=dao.deleteAllevent(dto);
	      logger.info("raw:"+raw);
	      
	      for(int i=0;i<jsondata.size(); i++) {
	    	    	  
	    	  String title=jsondata.get(i).get("title").toString();
	    	  String allDay=jsondata.get(i).get("allDay").toString();
	    	  String start=jsondata.get(i).get("start").toString();
	    	  String end=jsondata.get(i).get("end").toString();

	
	    	  
	    	  logger.info("title:"+title);
	    	  logger.info("allDay:"+allDay);
	    	  logger.info("start:"+start);
	    	  logger.info("end:"+end);
	    	  	
	    	  
	    	  
	    	  dto.setCal_cate(title);
	    	  dto.setCal_start(start);
	    	  dto.setCal_end(end);
	    	  dto.setCal_allday(allDay);
	    	  
	    	int row = dao.SaveMycalList(dto);
	    	logger.info("영향을 받은 행의 갯수:"+row);
	    	  
	      }	
	      
	      HashMap<String, Object> result = new HashMap<String, Object>();
	      result.put("memId",mem_id);
	      
	      
		return result;
	}



}
