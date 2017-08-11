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
import com.mvc.service.CashService;


@WebServlet("/mainlist")
public class MainListcontroller extends HttpServlet {
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
		String id = (String)request.getSession().getAttribute("loginId");
		System.out.println("/리스트 시작의id="+id);
		CashService service = new CashService();
		ArrayList<CashDTO> list = service.list(id);
		request.setAttribute("list",list);
		System.out.println("list예산값"+list);
		ArrayList<CashDTO> list2 = service.list2(id);
		request.setAttribute("list2", list2);
		ArrayList<CashDTO> list3 = service.list3(id);
		System.out.println("list3값"+list3);
		request.setAttribute("list3", list3);
		//ArrayList<CashDTO> list4 = service.list4(id);
		//request.setAttribute("list4", list4);
		System.out.println("리스트끝의 최종리스트의id="+id);
		//여기서 msg할시 여기껄로 전부 msg alert 보여짐. 
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
	}

}
