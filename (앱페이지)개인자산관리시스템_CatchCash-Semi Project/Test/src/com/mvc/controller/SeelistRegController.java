package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.CashDTO;
import com.mvc.service.SeelistRegService;

@WebServlet("/seelistidx")
public class SeelistRegController extends HttpServlet {
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
		
		System.out.println("일별 상세보기 reg_date 가져오기");
		
		String user_id = request.getParameter("user_id");
		String reg = null;
		SeelistRegService service = new SeelistRegService();
		
		System.out.println(user_id);
		
		reg = service.seelistreg(user_id);
		
		System.out.println(reg);
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("reg_date", reg);
		RequestDispatcher dis = request.getRequestDispatcher("seelist");
		dis.forward(request, response);
		
	}
}