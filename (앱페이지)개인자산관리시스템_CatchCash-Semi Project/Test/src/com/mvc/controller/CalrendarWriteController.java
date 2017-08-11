package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CalrendarDAO;

@WebServlet("/calwrite")
public class CalrendarWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		String title = request.getParameter("content");
		String start = request.getParameter("startdate");
		String id = (String) request.getSession().getAttribute("loginId");
		System.out.println("캘린더메모id="+id);
		
		CalrendarDAO dao = new CalrendarDAO();
		System.out.println(dao.write(title,start,id));

		RequestDispatcher dis = request.getRequestDispatcher("calrendar");
		dis.forward(request, response);

	}

}
