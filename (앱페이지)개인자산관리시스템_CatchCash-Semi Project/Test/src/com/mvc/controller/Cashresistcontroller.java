package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CCDAO;
import com.mvc.service.CashService;

@WebServlet({ "/cashresist" })
public class Cashresistcontroller extends HttpServlet {
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
		/*
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String addr = uri.substring(context.length());
		*/
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getSession().getAttribute("loginId");
		String reg_date = request.getParameter("reg_date");
		String part = request.getParameter("part");
		String way = request.getParameter("way");
		String kind = request.getParameter("kind");
		String content = request.getParameter("resistcontent");
		int money = Integer.parseInt(request.getParameter("price"));
		System.out.println(id+"아이디"+reg_date+"/"+part+"/"+way+"/"+kind+"/"+content+"/"+money);
		
		String msg="";
		CCDAO dao = new CCDAO();
		if(dao.resist(id,reg_date,part,way,kind,content,money)==1){
			msg="가계부를 등록하였습니다.";
		}else{
			msg="가계부등록을 실패하였습니다.";
		}
		request.setAttribute("가계부dao", dao); // 안씀.
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("mainlist");
		dis.forward(request, response);
	
	}

}
