package com.mvc.service;

import java.util.ArrayList;

import com.mvc.dao.SeelistRegDAO;
import com.mvc.dto.CashDTO;

public class SeelistRegService {

	public String seelistreg(String user_id) {
		
		SeelistRegDAO dao = new SeelistRegDAO();
		
		String reg = dao.seelistreg(user_id);
		
		return reg;
	}
}
