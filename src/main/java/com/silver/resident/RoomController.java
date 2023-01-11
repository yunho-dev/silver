package com.silver.resident;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	

	

}
