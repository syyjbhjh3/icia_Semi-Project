package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.ModifyService;

@WebServlet("/modify2")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		proccess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		proccess(request, response);
	}

	private void proccess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String bbsno = request.getParameter("bbsno");
		
		System.out.println("수정 이동");
		
		ModifyService service = new ModifyService();
		String msg = "수정 실패";
		
		int result = service.modify(subject, content, bbsno);
		
		if(result == 1){
			msg = "수정 완료";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("bbsno", bbsno);
		RequestDispatcher dis = request.getRequestDispatcher("detail");
		dis.forward(request, response);
	}

}
