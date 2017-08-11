package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.Maindao;
import com.mvc.dto.Iddto;

public class Mainservice {
	
	HttpServletRequest request = null;
	HttpServletResponse response = null;
	
	public Mainservice(HttpServletRequest request, 
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void join() throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("userName");
		String gender = request.getParameter("human");
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String rpw = request.getParameter("Pwcheck");
		String yang = request.getParameter("yang");
		String birth = request.getParameter("birthday");
		String email = request.getParameter("email");
		String usernum = request.getParameter("number");
		String fownumber = request.getParameter("fowNum");
		String backnumber = request.getParameter("backNum");
		
		System.out.println(name+"/"+gender+"/"+id+"/"+pw+"/"+rpw+"/"+yang+"/"+birth+"/"+email+"/"+usernum+"/"+fownumber+"/"+backnumber);
		
		String msg ="";
		String page="";
		Maindao dao = new Maindao();
		if(dao.join(name,gender,id,pw,rpw,yang,birth,email,usernum,fownumber,backnumber)==1){
			page = "index.jsp";
			msg = "회원등록에 성공 했습니다.";
		}else{
			page = "joinForm.jsp";
			msg = "회원등록에 실패 했습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

	public void login() throws ServletException, IOException{
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		System.out.println(id+"/"+pw);
		String page="index.jsp";
		String msg = "";
		Maindao dao = new Maindao();
		if(dao.login(id,pw)){
			request.getSession().setAttribute("loginId", id);
			page="mainlist";
		}else{
			msg="아이디 혹은 비밀번호를 확인 하세요.";
			request.setAttribute("result", msg);
			
		}
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

	public void logout() throws ServletException, IOException{
		request.getSession().removeAttribute("id");
		response.sendRedirect("index.jsp");
		
	}

	public void Idcheck() throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		int che=0;
		String name = request.getParameter("userName");
		String gender = request.getParameter("human");
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String rpw = request.getParameter("Pwcheck");
		String yang = request.getParameter("yang");
		String birth = request.getParameter("birthday");
		String email = request.getParameter("email");
		String usernum = request.getParameter("number");
		String fownumber = request.getParameter("fowNum");
		String backnumber = request.getParameter("backNum");
		
		System.out.println(id);
		Maindao dao = new Maindao();
		che = dao.Idcheck(id);
		String mg ="";
		int count = 0;
		if(che==1){
			mg = "아이디가 이미 존재합니다.";
		}else{
			mg = "아이디를 사용할 수 있습니다.";
			count = 1;
		}
		request.setAttribute("count",count );
		request.setAttribute("name",name );
		request.setAttribute("gender",gender );
		request.setAttribute("id",id );
		request.setAttribute("pw",pw );
		request.setAttribute("rpw",rpw );
		request.setAttribute("yang",yang );
		request.setAttribute("birth",birth );
		request.setAttribute("email",email );
		request.setAttribute("fownumber",fownumber );
		request.setAttribute("backnumber",backnumber );
		request.setAttribute("mg", mg);
		RequestDispatcher dis =request.getRequestDispatcher("joinForm.jsp");
		dis.forward(request, response);
	}

	public void Pwcha() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("userName");
		String id = request.getParameter("userId");
		String email= request.getParameter("email");
		
		System.out.println(name+"/"+id+"/"+email);
		String page="findpw.jsp";
		Maindao dao = new Maindao();
		if(dao.Pwcha(name,id,email)){
			page="Pwlist.jsp";
			request.getSession().setAttribute("id", id);
		}else{
			request.setAttribute("result", "맞는 정보를 찾을 수 없습니다.");
			
		}
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

	public void modify() throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String rpw = request.getParameter("userRPw");
		String cha="";
		String page="";
		System.out.println(pw);
		
		Maindao dao = new Maindao();
		if(dao.modify(id,pw,rpw) ==1){
			cha = "비밀번호 변경완료";
			page = "index.jsp";
		}else{
			cha="비밀번호 수정실패";
			page="Pwlist.jsp";
		}
		
		request.setAttribute("result", cha);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

	public void Idfind() throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("userName");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		System.out.println(name+"/"+email);
		String page = "findId.jsp";
		Maindao dao = new Maindao();
		if(dao.Idfind(name,email,birth)){
			page="list";
		}else{
			request.setAttribute("mmg", "맞는 정보의 아이디가 없습니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
	}

	public void list() throws ServletException, IOException{
		String id = request.getParameter("userId");
		String name = request.getParameter("userName");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		Maindao dao = new Maindao();
		ArrayList<Iddto> dto = dao.list(id,name,email,birth);
		request.setAttribute("list",dto );
		RequestDispatcher dis = request.getRequestDispatcher("IDlist.jsp");
		dis.forward(request, response);
		
	}


}

