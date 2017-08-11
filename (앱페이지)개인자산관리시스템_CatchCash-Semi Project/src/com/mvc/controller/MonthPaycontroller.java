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
import com.mvc.dto.MonthpayDTO;


@WebServlet({ "/monthpay" })
public class MonthPaycontroller extends HttpServlet {
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
		
		String id = (String) request.getSession().getAttribute("loginId");
		String month = request.getParameter("month");
		System.out.println(id+"/"+month);
		CCDAO dao = new CCDAO();
		ArrayList<MonthpayDTO> list1 = new ArrayList<MonthpayDTO>();
		list1 = dao.list1(id,month);
		ArrayList<MonthpayDTO> list2 = new ArrayList<MonthpayDTO>();
		list2 = dao.list2(id,month);
		ArrayList<MonthpayDTO> list3 = new ArrayList<MonthpayDTO>();
		list3 = dao.list3(id,month);
		ArrayList<MonthpayDTO> list4 = new ArrayList<MonthpayDTO>();
		list4 = dao.list4(id,month);
		ArrayList<MonthpayDTO> list5 = new ArrayList<MonthpayDTO>();
		list5 = dao.list5(id,month);
		ArrayList<MonthpayDTO> list6 = new ArrayList<MonthpayDTO>();
		list6 = dao.list6(id,month);
		ArrayList<MonthpayDTO> list7 = new ArrayList<MonthpayDTO>();
		list7 = dao.list7(id,month);
		ArrayList<MonthpayDTO> list8 = new ArrayList<MonthpayDTO>();
		list8 = dao.list8(id,month);
		ArrayList<MonthpayDTO> list9 = new ArrayList<MonthpayDTO>();
		list9 = dao.list9(id,month);
		ArrayList<MonthpayDTO> list10 = new ArrayList<MonthpayDTO>();
		list10 = dao.list10(id,month);
		ArrayList<MonthpayDTO> list11 = new ArrayList<MonthpayDTO>();
		list11 = dao.list11(id,month);
		ArrayList<MonthpayDTO> list12 = new ArrayList<MonthpayDTO>();
		list12 = dao.list12(id,month);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);
		request.setAttribute("list6", list6);
		request.setAttribute("list7", list7);
		request.setAttribute("list8", list8);
		request.setAttribute("list9", list9);
		request.setAttribute("list10", list10);
		request.setAttribute("list11", list11);
		request.setAttribute("list12", list12);
		
		RequestDispatcher dis = request.getRequestDispatcher("monthpay.jsp");
		dis.forward(request, response);
	}

}
