package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CCDAO;




@WebServlet({ "/budgetresist"})
public class Budgetcontroller extends HttpServlet {
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
			throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String budgetmoney = request.getParameter("budgetm");
		String budgetstart = request.getParameter("budgetstart");
		String budgetend = request.getParameter("budgetend");
		String id = (String)request.getSession().getAttribute("loginId");
		System.out.println(id+"/"+budgetmoney+"/"+budgetstart+"/"+budgetend);
		
		String msg="";
		CCDAO dao = new CCDAO();
		if(dao.budget(id,budgetmoney,budgetstart,budgetend)==1){
			msg="예산등록에 성공했습니다.";
		}else{
			msg="예산등록에 실패했습니다.";
		}
		request.setAttribute("main", dao);
		request.setAttribute("result", msg);
		//Mainlist 입력되었던 값들 가져오기 때문에 추가
		RequestDispatcher dis = request.getRequestDispatcher("mainlist"); // 가야할곳
		dis.forward(request, response);
	}
	
}
