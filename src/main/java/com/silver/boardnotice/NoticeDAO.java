package com.silver.boardnotice;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {

	ArrayList<NoticeDTO> listCall(int page);

	int noticeSizeTotal();

	NoticeDTO detailCall(String bd_idx);

}
