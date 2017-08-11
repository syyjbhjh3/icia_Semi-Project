package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CalrendarDAO;
import com.mvc.dto.CalrendarDTO;

@WebServlet("/calrendar")
public class CalrendarControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		String id = (String) request.getSession().getAttribute("loginId");
		System.out.println("캘린더의id="+id);
		CalrendarDAO dao = new CalrendarDAO();
		if(dao.list(id)!=null){
			ArrayList<CalrendarDTO> list = dao.list(id);
			request.setAttribute("list", list);
		}
		RequestDispatcher dis = request.getRequestDispatcher("calendar3.jsp");
		dis.forward(request, response);
		
	}


}
