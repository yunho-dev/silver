package com.silver.resident;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfestDAO {

	

	

	ArrayList<HashMap<String, Object>> infestListCall(int offset);

	int totalCount();

}
