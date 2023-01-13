package com.silver.donation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class DonationController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DonationService service;
	
	@GetMapping(value = "/donation")
	public ModelAndView donation() {
		ModelAndView mav = new ModelAndView("doantion/donationList");
		return mav;
	}

















}
