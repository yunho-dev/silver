package com.silver.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
	
	@Autowired MainDAO dao;

	public String test() {
		return dao.test();
	}

}
