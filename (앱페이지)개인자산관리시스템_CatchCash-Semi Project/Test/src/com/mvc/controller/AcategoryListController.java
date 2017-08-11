package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CategoryListDAO;
import com.mvc.dto.CategoryListDTO;

@WebServlet("/categorylist")
public class AcategoryListController extends HttpServlet {
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
		String id = (String) request.getSession().getAttribute("loginId");
		String mon = request.getParameter("mon");
		if(mon==null){
			mon = "2017-05";
		}
		System.out.println(id+"/"+mon);
		CategoryListDAO dao = new CategoryListDAO();
		ArrayList<CategoryListDTO> categorylist = new ArrayList<>();
		categorylist = dao.list(id,mon);
		request.setAttribute("categorylist", categorylist);
		RequestDispatcher dis = request.getRequestDispatcher("categoryList.jsp");
		dis.forward(request, response);
	}

}
