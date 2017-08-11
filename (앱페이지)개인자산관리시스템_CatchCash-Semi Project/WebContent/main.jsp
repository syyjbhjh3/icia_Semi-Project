<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <script src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style>
        	div{
        		display:block;
        		float:left;
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
        		margin-left: 100px;
        		/*기본가로길이가 50%를 넘어서 50%하면 안에서 짤려서나뉨. */
        	}
        	/*
        		width:50%;
        		margin:0 auto;
        		overflow : auto;
        	*/
     		.list{
     			display:block;
     			clear :left;
     			width:98%;
     			
     		}
     		#resister{
     		}
     		#link{
     		border : none;
     		float:left;
     		}
     		img{
     			margin : 1px;
     		}
     		     		
     		
   			li{
   				display:block;
   			}
   			
   			#id{
   				margin-left: 50px;
   			}
   			table,td,th{
   			}

#pattern-style-a
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 13px;
	width: 350px;
	margin-left : 10px;/*테이블위치이동*/
	text-align: center;
	border-collapse: collapse;
	background: url('pattern.png');
}
#pattern-style-a thead tr
{
	background: url('pattern-head.png');
}
#pattern-style-a th
{
	font-size: 13px;
	padding : 7px; /*td까지 자연스레 간격보기좋아짐*/
	font-weight: normal;
	border-bottom: 1px solid #fff;
	color: #039;
}
#pattern-style-a td
{
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;/*transparent-선안보이게하기*/
}
/*#pattern-style-a tbody tr:hover td
{
	color: #339;
	background: #fff;
}
*/
.patternyes:hover{
	color: #339;
	background: #fff;
}

<!--다른거임-->
#pattern-style-b
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 10px;
	width: 300px;
	
	text-align: center;
	border-collapse: collapse;
	background: url('pattern.png');
}
#pattern-style-b thead tr
{
	background: url('pattern-head.png');
}
#pattern-style-b th
{
	font-size: 10px;
	font-weight: normal;
	padding: 8px;
	border-bottom: 1px solid gray;
	color: #039;
}
#pattern-style-b td
{

	border-bottom: 1px solid gray;
	color: #669;
	border-top: 1px solid transparent;
}
#pattern-style-b tbody tr:hover td
{
	color: #339;
	background: #fff;
}

        </style>
    </head>
    <body>
    	
    	<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/><br/>
    	<jsp:include page="loginbox.jsp"/><br/><br/>
    	<div class="list" style="margin-bottom: 10px; margin-left: 3%;">
    	<form name="myForm" method="post">
    		<table id="pattern-style-a" summary="Meeting Results">
    		<!--<table id="pattern-style-b" style="width:100%;">-->
    		<c:forEach items="${list3}" var="list3">
	    	<tr>
	    		<c:choose>
				<c:when test="${list3.money < '0'}">
				
				<td style="text-align: center;"><font color="red">예산이 초과되었습니다.</font></td>
				<td style="text-align: center;"><font color="red">총잔액 : ${list3.money}</font></td>
				</c:when>
				<c:otherwise>
				<td colspan="2" style="text-align: center;">총잔액 : ${list3.money}</td>
				</c:otherwise>
				</c:choose>
	    	</tr>
	    	</c:forEach>
    		
    		<tr>
	    		<td style="text-align:center; width: 50%;">
	    		<c:forEach items="${list}" var="item">
	    		<span>시작일: <input type="date" name="budgetstart" value="${item.budgetstart}"/>
	    		<br/>
	    		종료일: <input type="date" name="budgetend" value="${item.budgetend}"/></span>
	    		</td>
	    		<td>
	    		예산액:
	    		<input type="text" name="budgetm" 
	    		value="${item.budgetmoney}" style="text-align:center; width:120px;"/>
	    		</c:forEach>
	    		<input type="button" value="예산설정" onclick="budgetSubmit(2)"/>
	    		</td>
	    	</tr>
	    	
    		<tr>
    			<th style="text-align:center;">날짜</th>
    			<td><input type="date" name="reg_date" id="todaycheck"></td>
    		</tr>
    		<tr>
    			<th style="text-align:center;">구분</th>
    			<td> 
    				<input type="radio" name="part" value="수입" checked/>수입
         			<input type="radio" name="part" value="지출"/>지출
         		</td>
			</tr>
			<tr> 
				<th style="text-align:center;">결제수단</th>
				<td>
					<input type="radio" name="way" value="현금" checked/>현금
	            	<input type="radio" name="way" value="은행"/> 은행
	            	<input type="radio" name="way" value="카드"/> 카드
	            </td>
            </tr>
			<tr>
    			<th style="text-align:center;">항목</th>
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
	            <th style="text-align:center;">내용</th>
	            <td>
	            	<input type="text" name="resistcontent" 
	            	placeholder="입력할 내용" style="width:135px;"/>
	        	</td>
        	</tr>
        	<tr>
        		<th style="text-align:center;">금액</th>	
        		<td> 
        			<input type="text" name="price" style="text-align:center; width:135px;"/>
        		</td>
        	</tr>
        	<tr>
        		<th colspan="2" style="text-align: center;"><input id="resister" type="button" value ="가계부등록" onclick="budgetSubmit(3)"/></th>
        	</tr>
        	</table>
        	</form>
        </div>
        
        
        <br/><br/><br/><br/><br/>
        <!--
        width: 37%;수입 = 수입칸 뒤에 스페이스바가 늘어남. 
        padding : 45px;50000 = 50000칸에 스페이스바가 늘어남. right는 오른쪽으로
        margin-left:3px; 일시불 = 일시불 앞에 공간이 3px 만큼 벌어짐. 장애물 부딪히면 다음줄로감.
        -->
        	<div class="list" style="height:45%; margin-left:1%; overflow:auto;">
			<table id="pattern-style-a" summary="Meeting Results">
			   <thead>
			    	<tr>
			        	<th scope="col">Date</th>
			            <th scope="col" >Part</th>
			            <th scope="col" >Way</th>
			            <th scope="col" >Kind</th>
			            <th scope="col" style="width: 20%;">Content</th>
			            <th scope="col">Price</th>
			            <th scope="col" >Modify</th>
			            <th scope="col" >Delete</th>
			        </tr>
			  </thead>
			  <tbody>
       			<c:forEach items="${list2}" var="item2">
       				<tr class="patternyes">
       					<td style="display: none;">${item2.idx}</td>
	       		 	    <td>${item2.reg_date}</td>
            			<td>${item2.part}</td>
            			<td>${item2.way}</td>
						<td>${item2.kind}</td>
						<td>${item2.content}</td>
            			<td>${item2.money}</td>
	       		 		<td><input type="button" style="width:100%;" value="수정" onclick="location.href='cashdetail?idx=${item2.idx}'"></td>
	       		 		<td><input type="button" style="width:100%;" value="삭제" onclick="location.href='cashdelete?idx=${item2.idx}'"></td>
	       		 	</tr>
	       		 	
	       		 </c:forEach>
	       		 </tbody>
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
   	</script>
</html>