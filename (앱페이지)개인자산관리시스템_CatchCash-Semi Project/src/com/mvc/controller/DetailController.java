package com.mvc.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.BoardDTO;
import com.mvc.dto.CommentReadDTO;
import com.mvc.service.DetailService;

@WebServlet("/detail")
public class DetailController extends HttpServlet {
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
		System.out.println("상세 보기 이동");
		
		String bbsno = request.getParameter("bbsno");
		String userId = request.getParameter("userId");
		String loginId = (String) request.getSession().getAttribute("loginId");
		String msg = request.getParameter("msg");
		String page = null;
		
		if(userId == null){
			userId = (String) request.getAttribute("userId");
		}
		
		System.out.println(bbsno+" / "+userId);
		
		DetailService service = new DetailService();
		BoardDTO dto = new BoardDTO();
		ArrayList<CommentReadDTO> list = new ArrayList<CommentReadDTO>();
		
		if(service.uphit(bbsno) == 1){
			dto = service.detail(bbsno);
			list = service.commentread(bbsno);
		}
		
		if(userId.equals(loginId)){
			page = "detail.jsp";
		}else{
			page = "detail2.jsp";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("commentlist", list);
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
	}

}
