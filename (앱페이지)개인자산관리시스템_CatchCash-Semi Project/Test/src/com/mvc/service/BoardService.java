package com.mvc.service;

import java.util.ArrayList;

import com.mvc.dao.BoardDAO;
import com.mvc.dto.BoardDTO;

public class BoardService {

	public ArrayList<BoardDTO> board() {
		System.out.println("보드 서비스 이동");
		
		ArrayList<BoardDTO> list;
		BoardDAO dao = new BoardDAO();
		
		list = dao.board();
		
		return list;
		
	}
}