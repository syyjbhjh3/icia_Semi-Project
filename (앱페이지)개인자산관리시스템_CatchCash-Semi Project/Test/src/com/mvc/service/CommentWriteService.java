package com.mvc.service;

import com.mvc.dao.CommentWriteDAO;

public class CommentWriteService {

	public int commentwrite(String comments, String bbsno, String user_id) {
		CommentWriteDAO dao = new CommentWriteDAO();
		
		int result = dao.commentwrite(comments, bbsno, user_id);
		
		return result;
	}

}
