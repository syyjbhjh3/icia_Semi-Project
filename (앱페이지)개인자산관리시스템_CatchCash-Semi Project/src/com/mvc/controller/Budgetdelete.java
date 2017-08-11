package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CCDAO;
import com.mvc.dto.CashDTO;
import com.mvc.service.CashService;


@WebServlet("/budgetdelete")
public class Budgetdelete extends HttpServlet {
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
		System.out.println("이것을이용해봅시다."+id);
		CCDAO dao = new CCDAO();
		CashService service = new CashService();
		String msg ="";
		if(dao.delete(id)==1){
			msg = "예산을 설정합시다.";
		}else{
			msg = "예산을 설정합시다..";
		}
		ArrayList<CashDTO> list2 = service.list2(id);
		request.setAttribute("list2", list2);
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("main2.jsp"); //리스트 갱신
		dis.forward(request, response);
	}

}
