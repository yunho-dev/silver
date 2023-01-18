package com.silver.mycal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MycalService {
	
	@Autowired MycalDAO dao;
	
	Logger logger=LoggerFactory.getLogger(getClass());

}
