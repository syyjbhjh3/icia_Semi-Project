<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="demo.css" />
     	<link rel="stylesheet" type="text/css" href="backgroundTransition.css" />
        <style>
        @import url(http://weloveiconfonts.com/api/?family=fontawesome);
		@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
		[class*="fontawesome-"]:before {
		h2{
		}
		  font-family: 'FontAwesome', sans-serif;
		}
		* {
		  box-sizing: border-box;
		}
		
		html {
		  height: 100%;
		}
		
		body {
		  background-color: #2c3338;
		  color: #606468;
		  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
		  margin: 0;
		  min-height: 100%;
		}
		
		a {
		  color: #000000;
		  outline: 0;
		  text-decoration: none;
		}
		a:focus, a:hover {
		  text-decoration: underline;
		}
		
		input {
		  border: 0;
		  color: inherit;
		  font: inherit;
		  margin: 0;
		  outline: 0;
		  padding: 0;
		  -webkit-transition: background-color .3s;
		          transition: background-color .3s;
		}
		
		.site__container {
		  -webkit-box-flex: 1;
		  -webkit-flex: 1;
		      -ms-flex: 1;
		          flex: 1;
		  padding: 3rem 0;
		}
		
		.form input[type="password"], .form input[type="text"], .form input[type="submit"],.form input[type="button"] {
		  width: 100%;
		}
		.form--login {
		  color: #606468;
		}
		.form--login label,
		.form--login input[type="text"],
		.form--login input[type="password"],
		.form--login input[type="submit"],
		.form--login input[type="button"] {
		  border-radius: 0.25rem;
		  padding: 1rem;
		}
		.form--login label {
		  background-color: #363b41;
		  border-bottom-right-radius: 0;
		  border-top-right-radius: 0;
		  padding-left: 1.25rem;
		  padding-right: 1.25rem;
		}
		.form--login input[type="text"],span ,.form--login input[type="password"] {
		  background-color: #3b4148;
		  border-bottom-left-radius: 0;
		  border-top-left-radius: 0;
		}
		.form--login input[type="text"]:focus, span,.form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
		  background-color: #434A52;
		}
		.form--login input[type="submit"],.form--login input[type="button"] {
		  background-color: #ea4c88;
		  color: #eee;
		  font-weight: bold;
		  text-transform: uppercase;
		  margin : 2px;
		}
		.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover, 
		.form--login input[type="button"]:focus, .form--login input[type="button"]:hover{
		  background-color: #d44179;
		}
		.form__field {
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  margin-bottom: 1rem;
		}
		.form__input {
		  -webkit-box-flex: 1;
		  -webkit-flex: 1;
		      -ms-flex: 1;
		          flex: 1;
		}
		
		.align {
		  -webkit-box-align: center;
		  -webkit-align-items: center;
		      -ms-flex-align: center;
		          align-items: center;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-orient: horizontal;
		  -webkit-box-direction: normal;
		  -webkit-flex-direction: row;
		      -ms-flex-direction: row;
		          flex-direction: row;
		}
		
		.hidden {
		  border: 0;
		  clip: rect(0 0 0 0);
		  height: 1px;
		  margin: -1px;
		  overflow: hidden;
		  padding: 0;
		  position: absolute;
		  width: 1px;
		}
		
		.text--center {
		  text-align: center;
		}
		
		.grid__container {
		  margin: 0 auto;
		  max-width: 20rem;
		  margin-top : -7%;
		  width: 100%;
		  }
		  
		  .site__container{
		  margin-top : 10%;
		  }
		  .spanman{
		  	margin-top:5%;
		  	margin-left:30%;
		  }
		  .spanwoman{
		  	margin-top:5%;
		  	margin-left:5%;
		  }
		  .spanfr{
		  	margin-top:5%;
		  	margin-left:5%;
		  }
        
      </style>
  </head>
  <body class="align">

      <div class="backgroundTransition">
          
              <div class="site__container">

    <div class="grid__container">

      <form action="join" method="post" name="frm" class="form form--login">

        <div class="form__field" style="margin-top:-20%;">
          <label class="fontawesome-user" for="login__username"><font ></font><span class="hidden">UserId</span></label>
          <input id="login__username" type="text" class="form__input" name="userId" placeholder="Username" required>
		        <button name="check" onclick="Idcheck(1)">중복확인</button>
		          
        </div>
        
        <div class="form__field" >
          <label class="fontawesome-user" for="login__username"><font ></font><span class="hidden">Username</span></label>
          <input id="login__username" type="text" class="form__input" name="userName" placeholder="Username" required>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -2%"><span class="hidden">Password</span></label>
          <input id="login__password" type="password" name="userPw" class="form__input" placeholder="Password" required>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -2%"><font></font><span class="hidden">Password</span></label>
          <input id="login__password" type="password" name="Pwcheck"" class="form__input" placeholder="Password Check" required>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -2%"><font></font><span class="hidden">E-Mail</span></label>
          <input id="login__password" type="text" name="email" class="form__input" placeholder="E-Mail" required>
        </div>
        
         <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -2%"><font></font><span class="hidden">E-Mail</span></label>
          <span id="login__password" class="form__input" placeholder="E-Mail" required>
          <div class="spanman"><input type="radio" name="human" value="man" class="form__input" checked/>남자
          <input type="radio" name="human" value="woman" />여자
          </div>
          </span></div>
          
          <div class="form__field" >
          	<label class="fontawesome-user" for="login__username"><font ></font><span class="hidden">Username</span></label>
          	<span id="login__username" class="form__input" >
          	<div class="spanwoman">
          	<input type="radio" name="yang" value="양력" checked/>양력
         	<input type="radio" name="yang" value="음력"/>음력
         	<input type="date" name="birthday"/>
         	</div>
          </span>
        </div>
        
        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="margin-right: -2%"><font></font><span class="hidden">E-Mail</span></label>
          <span id="login__password"  class="form__input">
           <div class ="spanfr">
           <select name="number">
                    	<option value="010">010</option>
                    	<option value="011">011</option>
                    	<option value="016">016</option>
                    	<option value="017">017</option>
                    	<option value="019">019</option>
                    </select>-
                    
                    <input type="Number" name="fowNum" style="width : 90px;"/>-
                    <input type="Number" name="backNum" style="width : 90px;"/>
                    </div>
          </span>
        </div>

        <div class="form__field" style="float:left;width:50%;">
          <input type="submit" onclick="checking()"  value="Regist">
        </div><div class="form__field">  
          <input type="button" onclick="location.href='index.jsp'" value="Cancel">
        </div>
       
        <div class="form__field">
        </div>
      </form>

    </div>

  </div>
  </div>
    </body>
    <script type="text/javascript" src="backgroundTransition.js"></script>
    <script>
	var ch = document.frm;
	
	function Idcheck(index){
		if(index==1){
			document.frm.action='Idcheck';
		}
		document.frm.submit();
	}
	
	function checking(){
		if(ch.userName.value ==""){
			alert("이름을 입력하세요.");
			return false;
		}else if(ch.userId.value ==""){
			alert("아이디를 입력하세요.");
			return false;
		}else if(ch.userPw.value ==""){
			alert("패스워드를 입력하세요.");
			return false;
		}else if(ch.userPw.value != ch.Pwcheck.value){
			alert("패스워드가 같지 않습니다.");
			ch.Pwcheck.value = "";
			return false;
		}else if(ch.email.value ==""){
			alert("이메일을 입력하세요.");
			return false;
		}else if(ch.fowNum.value ==""){
			alert("휴대폰 번호를 다 입력하세요.");
			return false;
		}else if(ch.backNum.value ==""){
			alert("휴대폰 번호를 다 입력하세요.");
			return false;
			
		}
	}
	var mg = "${mg}";
		if(mg!=""){
			alert(mg);
		}
    $('.backgroundTransition').backgroundTransition({
		  backgrounds:[
			  { src: 'http://www.blueb.co.kr/SRC2/_image/01.jpg' },
			  { src: 'money.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/03.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/04.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/05.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/06.jpg' },
			  { src: 'http://www.blueb.co.kr/SRC2/_image/07.jpg' }
		  ],
		  transitionDelay: 3,
		  animationSpeed: 800
	  });

    </script>
</html>