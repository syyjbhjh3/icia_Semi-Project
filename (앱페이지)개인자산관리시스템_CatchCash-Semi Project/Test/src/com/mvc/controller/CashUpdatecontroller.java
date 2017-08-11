package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.CashService;


@WebServlet("/cashupdate")
public class CashUpdatecontroller extends HttpServlet {
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
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getSession().getAttribute("loginId");
		String idx = request.getParameter("idx");
		String reg_date = request.getParameter("reg_date");
		String part = request.getParameter("part");
		String way = request.getParameter("way");
		String kind = request.getParameter("kind");
		String content = request.getParameter("content");
		int money = Integer.parseInt(request.getParameter("money"));
		System.out.println("수정완료까지가져나오나id="+id+"/"+idx+"/"+reg_date+"/"+part+"/"+way+"/"+kind+"/"+content+"/"+money);
		
		CashService service = new CashService();
		String page="";
		String msg="";
		if(service.update(id,idx,reg_date,part,way,kind,content,money)==1){
			page="mainlist";
			msg="수정에 성공하였습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

}
