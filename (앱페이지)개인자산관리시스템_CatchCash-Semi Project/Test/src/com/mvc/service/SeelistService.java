package com.mvc.service;

import java.util.ArrayList;
import java.util.HashSet;

import com.mvc.dao.SeelistDAO;
import com.mvc.dto.CashDTO;

public class SeelistService {

	public ArrayList<CashDTO> seelist(String reg, String user_id) {
		
		ArrayList<CashDTO> list = new ArrayList<CashDTO>();
		SeelistDAO dao = new SeelistDAO();
		
		list = dao.seelist(reg, user_id);
		
		return list;
	}

	public HashSet<String> seelistreg(String user_id) {
		
		HashSet<String> reglist = new HashSet<String>();
		SeelistDAO dao = new SeelistDAO();
		
		reglist = dao.seelistreg(user_id);
		
		return reglist;
	}
}
