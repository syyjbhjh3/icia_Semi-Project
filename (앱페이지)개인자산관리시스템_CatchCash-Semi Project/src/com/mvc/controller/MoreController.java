package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.MoreService;

@WebServlet("/moreread")
public class MoreController extends HttpServlet {
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
		
		String end = request.getParameter("end");
		
		System.out.println("더보기 이동");
		System.out.println(end);
		
		MoreService service = new MoreService();
	
		String end2 = service.moreread(end);
		
		System.out.println(end2);
		
		request.setAttribute("end2", end2);
		RequestDispatcher dis = request.getRequestDispatcher("board");
		dis.forward(request, response);
		
	}

}
