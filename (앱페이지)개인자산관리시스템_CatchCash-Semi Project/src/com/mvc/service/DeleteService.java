package com.mvc.service;

import com.mvc.dao.DeleteDAO;

public class DeleteService {

	public int delete(String bbsno) {
		
		int result = 0;
		
		DeleteDAO dao = new DeleteDAO();
		
		result = dao.delete(bbsno);
		
		return result;
	}

}
