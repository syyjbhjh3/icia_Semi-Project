package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CalrendarDAO;


@WebServlet("/caldelete")
public class CalrendarDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		process(request,response);
	}

	private void process(HttpServletRequest request, 
			HttpServletResponse response)
					throws ServletException, IOException{
		String calrendarno = request.getParameter("calrendarno");
		System.out.println(calrendarno);
		CalrendarDAO dao = new CalrendarDAO();
		dao.delete(calrendarno);
		RequestDispatcher dis = request.getRequestDispatcher("calrendar");
		dis.forward(request, response);

	}

}
