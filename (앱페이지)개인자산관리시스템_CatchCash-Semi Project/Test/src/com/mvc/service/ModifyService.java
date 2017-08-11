package com.mvc.service;

import com.mvc.dao.ModifyDAO;

public class ModifyService {

	public int modify(String subject, String content, String bbsno) {
		
		ModifyDAO dao = new ModifyDAO();
		int result = 0;
		
		result = dao.modify(subject, content, bbsno);
		
		return result;
	}

}
