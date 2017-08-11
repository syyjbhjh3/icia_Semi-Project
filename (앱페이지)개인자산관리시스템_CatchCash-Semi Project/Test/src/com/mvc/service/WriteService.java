package com.mvc.service;

import com.mvc.dao.WriteDAO;

public class WriteService {

	public String write(String writer, String subject, String content) {
		
		String msg = "작성 실패";
		WriteDAO dao = new WriteDAO();
		
		if(dao.write(writer, subject, content) == 1){
			msg = "작성 완료";
		}
		
		return msg;
	}
	
}
