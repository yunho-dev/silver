package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.silver.main.MainService;

@Controller
public class RoomController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	//private final RoomService roomservice;
	@Autowired RoomService roomservice;
	
//	public RoomController(RoomService roomservice) {
//		this.roomservice=roomservice;
//	}
	
	
	@GetMapping(value="/roomList")
	public ModelAndView roomList() {
		logger.info("생활실 List");
		
		return roomservice.roomList();
	}
	
	
	
	//생활실 등록 ajax
	@GetMapping(value="/roomWrite")
	@ResponseBody
	public HashMap<String, Object> roomWrite(@RequestParam String floor,@RequestParam String inroomName,@RequestParam String Total,@RequestParam String damdangSelect){
//		logger.info(floor);
//		logger.info(inroomName);
//		logger.info(Total);
//		logger.info(damdangSelect);
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		
		int row =roomservice.roomWrite(floor,inroomName,Total,damdangSelect);
		map.put("success", row);
		
		return map;
	}
	
	@GetMapping(value="roomlistCall.do")
	@ResponseBody
	public HashMap<String, Object> roomlistCall(){

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		ArrayList<RoomDTO> roomlistCall = roomservice.roomlistCall();
		
//		for (RoomDTO roomlistCa : roomlistCall) {
//			logger.info("확인요:" +roomlistCa);
//		}
		
		
		map.put("roomlistCall", roomlistCall);
	
		return map;


	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

}
