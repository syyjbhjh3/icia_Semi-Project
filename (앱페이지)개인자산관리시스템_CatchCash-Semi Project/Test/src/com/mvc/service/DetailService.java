package com.mvc.service;

import java.util.ArrayList;

import com.mvc.dao.DetailDAO;
import com.mvc.dto.BoardDTO;
import com.mvc.dto.CommentReadDTO;

public class DetailService {

	public BoardDTO detail(String bbsno) {
		
		BoardDTO dto = new BoardDTO();
		DetailDAO dao = new DetailDAO();
		
		dto = dao.detail(bbsno);
		
		return dto;
	}

	public ArrayList<CommentReadDTO> commentread(String bbsno) {
		
		ArrayList<CommentReadDTO> list = new ArrayList<CommentReadDTO>();
		DetailDAO dao = new DetailDAO();
		
		list = dao.commentread(bbsno);
		
		return list;
	}

	public int uphit(String bbsno) {
		
		DetailDAO dao = new DetailDAO();
		int result = 0;
		
		result = dao.uphit(bbsno);
		
		return result;
	}

}
