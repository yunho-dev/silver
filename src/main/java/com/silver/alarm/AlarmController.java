package com.silver.alarm;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AlarmController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private final AlarmService alarmservice;
	
	public AlarmController(AlarmService alarmservice) {
		this.alarmservice=alarmservice;
	}
	
	@ResponseBody
	@GetMapping(value="/AlarmCall")
	public HashMap<String, Object> AlarmCall(HttpServletRequest request){
		
		return alarmservice.AlarmCall(request);
	}
	
	@ResponseBody
	@GetMapping(value="/removeCount")
	public HashMap<String, Object> removeCount(@RequestParam int idx){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int row =alarmservice.removeCount(idx);
		logger.info("리무브카운트 idx 값은 : "+idx);
		map.put("row", row);
		return map;
		
	}
	
	
	

}
