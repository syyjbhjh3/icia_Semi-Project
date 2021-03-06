package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.CashDTO;
import com.mvc.service.CashService;


@WebServlet({ "/cashdetail" })
public class CashDetailcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		process(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		process(request,response);
	}


	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		System.out.println("가계부idx번호="+idx);
		String page="mainlist";
		CashService service = new CashService();
		CashDTO dto = service.detail(idx);
		if(dto!=null){
			page="cashdetail.jsp";
		}
		request.setAttribute("detail", dto);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

}
