<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="initial-scale=1, width=device-width"/> 
        <title>Insert title here</title>
        <style>
        	div{
        		display:block;
        		float:left;
        		border : 1px solid black;
        		/*정중앙배열
        		position:absolute;
				top:50%;
				left:50%;
				margin-top:-200px;<!--height의 반 -->
				margin-left:-250px;<!--width의 반 --> 
				*/
        	}
        	#resistdiv{
        		margin-top: -17px;
        		/*기본가로길이가 50%를 넘어서 50%하면 안에서 짤려서나뉨. */
        	}
        	/*
        		width:50%;
        		margin:0 auto;
        		overflow : auto;
        	*/
     		#list{
     			display:block;
     			clear :left;
     			width:60%;
     			/*입닥치고 왼쪽으로 간다*/ 
     		}
     		#resister{
     			margin-left : 50%;
     		}
     		#link{
     		border : none;
     		float:left;
     		}
     		img{
     			margin : 1px;
     		}
     		     		
     		ul {
     			border : 1px solid black;
   			}
   			li{
   				display:block;
   			}
   			table,td{
   				border: 1px solid black;
   			}
   			.cashtable{
   				text-align: center;
   				font-size: 10pt;
   			}
        </style>
    </head>
    <body>
    	<jsp:include page="aftercalendar.jsp"></jsp:include><br/><br/><br/><br/>
    	<jsp:include page="loginbox.jsp"/><br/><br/>
    	<form name="myForm" method="post">
    	<div id="resistdiv">
    		<table style="width:100%;">
    		<c:forEach items="${list3}" var="list3">
	    	<tr>
	    		<c:choose>
				<c:when test="${list3.money < '0'}">
				
				<td style="text-align: center;"><font color="red">예산이 초과되었습니다.</font></td>
				<td style="text-align: center"><font color="red">총잔액 : ${list3.money}</font></td>
				</c:when>
				<c:otherwise>
				<td colspan="2" style="text-align: center">총잔액 : ${list3.money}</td>
				</c:otherwise>
				</c:choose>
	    	</tr>
	    	</c:forEach>
    		<c:forEach items="${list}" var="item">
    		<tr>
	    		<td style="width: 50%;">
	    		<span>시작일: <input type="date" name="budgetstart" value="${item.budgetstart}"/></span>
	    		
	    		종료일: <input type="date" name="budgetend" value="${item.budgetend}"/>
	    		</td>
	    		<td style="text-align: center;">
	    		예산액:
	    		<input type="text" id="budgettext" name="budgetm" 
	    		value="${item.budgetmoney}" style="text-align:center; width:120px;" readonly/>
	    		</c:forEach>
	    		<input type="button" value="예산설정" onclick="budgetSubmit(2)"/>
	    		</td>
	    	</tr>
	    	<!--
	    	<c:forEach items="${list3}" var="list3">
	    	<tr>
	    		<c:choose>
				<c:when test="${list3.money < '0'}">
				
				<td style="text-align: center;"><font color="red">예산이 초과되었습니다.</font></td>
				<td style="text-align: center"><font color="red">총잔액 : ${list3.money}</font></td>
				</c:when>
				<c:otherwise>
				<td colspan="2" style="text-align: center">총잔액 : ${list3.money}</td>
				</c:otherwise>
				</c:choose>
	    	</tr>
	    	</c:forEach>
	    	-->
    		<tr>
    			<td style="text-align:center;">날짜</td>
    			<td><input type="date" name="reg_date" id="todaycheck"></td>
    		</tr>
    		<tr>
    			<td style="text-align:center;">구분</td>
    			<td> 
    				<input type="radio" name="part" value="수입" checked/>수입
         			<input type="radio" name="part" value="지출"/>지출
         		</td>
			</tr>
			<tr> 
				<td style="text-align:center;">결제수단</td>
				<td>
					<input type="radio" name="way" value="현금" checked/>현금
	            	<input type="radio" name="way" value="은행"/> 은행
	            	<input type="radio" name="way" value="카드"/> 카드
	            </td>
            </tr>
			<tr>
    			<td style="text-align:center;">항목</td>
    			<td>
    				<select name="kind">
			            <option value="식비" selected>식비</option>
			            <option value="회비">회비</option>
			            <option value="교통">교통</option>
			            <option value="통신">통신</option>
			            <option value="문화">문화</option>
			            <option value="의류">의류</option>
			            <option value="수입">수입</option>
			            <option value="기타">기타</option>
	            	</select>
    			</td>
    		</tr>
			<tr>
	            <td style="text-align:center;">내용</td>
	            <td>
	            	<input type="text" name="resistcontent" 
	            	placeholder="입력할 내용" style="width:138px;"/>
	        	</td>
        	</tr>
        	<tr>
        		<td style="text-align:center;">금액</td>
        		<td> 
        			<input type="text" name="price" style="text-align:center; width:138px;"/>
        		</td>
        	</tr>
        	</table>
        	<input id="resister" type="button" value ="가계부등록" onclick="budgetSubmit(3)"/>
        	</form>
        </div>
        
        
        
        
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <form name='frm'>
        </form>
        <br/><br/>
        <!--
        width: 37%;수입 = 수입칸 뒤에 스페이스바가 늘어남. 
        padding : 45px;50000 = 50000칸에 스페이스바가 늘어남. right는 오른쪽으로
        margin-left:3px; 일시불 = 일시불 앞에 공간이 3px 만큼 벌어짐. 장애물 부딪히면 다음줄로감.
        -->
        <br/>
        	<div id="list" style="height:38%; width:100%; overflow:auto;">
       		<table style="width:100%;" class="cashtable">
       			<tr>
       				<th>날짜</th>
       				<th>구분</th>
       				<th>수단</th>
       				<th>항목</th>
       				<th>내용</th>
       				<th>금액</th>
       				<th>수정</th>
       				<th>삭제</th>
       			</tr>
       			<c:forEach items="${list2}" var="item2">
       				<tr>
       					<td style="display: none;">${item2.idx}</td>
       					<td style="width: 10%; font-size:10pt;">${item2.reg_date}</td>
       					<td style="width: 8%;">${item2.part}</td>
	       		 		<td style="width: 8%;">${item2.way}</td>
	       		 		<td style="width: 8%;">${item2.kind}</td>
	       		 		<td style="width: 20%;">${item2.content}</td>
	       		 		<td style="width: 10%;">${item2.money}</td>
	       		 		<td style="width: 7%;"><input type="button" style="width:100%; height: 100%;" value="수정" onclick="location.href='cashdetail?idx=${item2.idx}'"></td>
	       		 		<td style="width: 7%;"><input type="submit" style="" value="삭제" onclick="location.href='cashdelete?idx=${item2.idx}'"></td>
	       		 	</tr>
	       		 </c:forEach>
	       	</table>
	       	</div>
	       	
   		<!-- 가장 넓은 width를 기준으로 모두 넓어진다. -->
   		<!-- 여기에 뭐 할시 img 있는곳으로 가버림 -->
   		 
   		 
   		 
    </body>
    <script>
    	/*
    	if(title.length>15){
			title= title.substring(0,14)+"...";
		}
    	*/
    	/*
    	var tmpDate = date.split("-");
    	return "~" + tmpDate[1] + "/" + tmpDate[2];
		*/
		//var str = ${"#content"} - var str = #content
		//new Date(); == 시스템 오늘날짜
		//document.getElementById('datestart').valueAsDate = new Date();
		document.getElementById('todaycheck').valueAsDate = new Date();
		/*
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		
		if(dd<10) {
		    dd='0'+dd
		} 
		
		if(mm<10) {
		    mm='0'+mm
		} 
		today = mm+'/'+dd+'/'+yyyy;
		*/
		function budgetSubmit(index){
			if(index==1){
				document.myForm.action='budgetresist';
			}
			if(index==2){
				document.myForm.action='budgetdelete';
			}
			if(index==3){
				document.myForm.action='cashresist';
			}
			document.myForm.submit();
		}
		var msg = "${result}"
			if(msg!=""){
				alert(msg);
			}
		function fncSubmit3()
	    {
	        var fm    = document.frm;
	        fm.method = 'get';
	        fm.action = 'board';
	        fm.submit();
	    }
		
   	</script>
</html>