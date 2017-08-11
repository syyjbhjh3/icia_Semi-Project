package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.Mainservice;


@WebServlet({"/join", "/login","/logout","/Idcheck","/Pwcha","/modify","/Idfind","/list"})
public class Maincontroller extends HttpServlet {
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
	public  void process(HttpServletRequest request, 
			HttpServletResponse response)
					throws ServletException, IOException{
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String add = uri.substring(context.length());
		
		Mainservice service = new Mainservice(request,response);
		
		switch(add){
			case"/join":
				service.join();
				break;
			case"/login":
				service.login();
				break;
			case"/logout":
				service.logout();
				break;
			case"/Idcheck":
				service.Idcheck();
				break;
			case"/Pwcha":
				service.Pwcha();
				break;
			case"/modify":
				service.modify();
				break;
			case"/Idfind":
				service.Idfind();
				break;
			case"/list":
				service.list();
				break;
		}
	}
}
