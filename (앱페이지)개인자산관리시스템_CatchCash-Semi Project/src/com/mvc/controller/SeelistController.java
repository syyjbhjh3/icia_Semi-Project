package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.CashDTO;
import com.mvc.service.SeelistService;

@WebServlet("/seelist")
public class SeelistController extends HttpServlet {
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
		System.out.println("일별 상세보기 이동");
		
		String user_id = request.getParameter("user_id");
		String reg = request.getParameter("reg_date");
		
		if(reg == null){
			reg = (String) request.getAttribute("reg_date");
		}
		
		System.out.println(reg+" / "+user_id);
		
		SeelistService service = new SeelistService();
		ArrayList<CashDTO> list = new ArrayList<CashDTO>();
		HashSet<String> reglist = new HashSet<String>();
		
		list = service.seelist(reg, user_id);
		reglist = service.seelistreg(user_id);
			
		request.setAttribute("reg", reg);
		request.setAttribute("list", list);
		request.setAttribute("reglist", reglist);
		RequestDispatcher dis = request.getRequestDispatcher("seelist.jsp");
		dis.forward(request, response);
	}
}