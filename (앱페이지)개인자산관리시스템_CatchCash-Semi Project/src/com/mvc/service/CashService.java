package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CCDAO;
import com.mvc.dto.CashDTO;

public class CashService {
	
	public CashService() {
		
	}

	public ArrayList<CashDTO> list(String id) {
		CCDAO dao = new CCDAO();
		
		return dao.list(id);
	}

	public ArrayList<CashDTO> list2(String id) {
		CCDAO dao = new CCDAO();
		return dao.list2(id);
	}

	public CashDTO detail(String idx) {
		CCDAO dao = new CCDAO();
		return dao.detail(idx);
	}

	public int update(String id,String idx, String reg_date, String part, String way, String kind, String content, int money) {
		CCDAO dao = new CCDAO();
		return dao.update(id,Integer.parseInt(idx), reg_date, part, way, kind, content, money);
	}

	public int cashdelete(String id,String idx) {
		CCDAO dao = new CCDAO();
		return dao.cashdelete(id,Integer.parseInt(idx));
	}

	public ArrayList<CashDTO> list3(String id) {
		CCDAO dao = new CCDAO();
		return dao.list3(id);
	}

	public ArrayList<CashDTO> list4(String id) {
		CCDAO dao = new CCDAO();
		return dao.list4(id);
	}
	

}
