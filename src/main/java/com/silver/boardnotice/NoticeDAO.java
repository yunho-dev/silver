package com.silver.boardnotice;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {

	ArrayList<NoticeDTO> listCall(int page);

	int noticeSizeTotal();

	NoticeDTO detailCall(String bd_idx);

	int searchNoticeTotal(String select, String seacontent);

	ArrayList<NoticeDTO> searchNotice(String select, String seacontent, int page);

	int writeBoard(NoticeDTO dto);

	void notiUpdate(String bd_idx, String mem_id, String bd_title, String bd_content);



}
