package com.silver.resident;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class RoomService {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());

	public ModelAndView RoomListCall() {
		ModelAndView mav= new ModelAndView("resident/roomList");
		return mav;
	}


}
