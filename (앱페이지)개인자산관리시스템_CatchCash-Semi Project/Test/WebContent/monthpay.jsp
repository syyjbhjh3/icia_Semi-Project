<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Insert title here</title>
		<style rel="stylesheet">
body {
  font-family: "Helvetica Neue", Helvetica, Arial;
  font-size: 14px;
  font-weight: 400;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background: #2b2b2b;
}

.wrapper {
  margin: 0 auto;
  padding: 40px;
  max-width: 800px;
}

.table {
  margin: 0 0 40px 0;
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
}

.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
@media screen and (max-width: 580px) {
  .row {
    padding: 8px 0;
    display: block;
  }
}

.cell {
  padding: 6px 12px;
  display: table-cell;
    text-align: center;
}
@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 12px;
    display: block;
  }
}
#cel2{
	margin-left: 57%;
}
#cel3{
	margin-left: 57%;
}
#cel1{
	position: absolute;
	margin-left: 15%;
}
div{
	font-size: 20px;
}
</style>
</head>
	<body>
		<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/>
		<form action="monthpay" method="post">
			<input type="year" name="month" placeholder="ex) 2017"/>
			<input type="submit" value="보기"/> 
		</form>
				<div class="row header green">
					<div class="cell" id="cel">
					      <span id="cel1">월</span>
					      <span id="cel2">수입 및 지출</span>
					</div>
    			</div>
				<c:forEach items="${list1}" var="list1">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">1월</span>
						<span id="cel2">월 수입 : ${list1. importhap}</span>
						<span id="cel3">월 지출 : ${list1.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list2}" var="list2">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">2월</span>
						<span id="cel2">월 수입 : ${list2. importhap}</span>
						<span id="cel3">월 지출 : ${list2.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list3}" var="list3">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">3월</span>
						<span id="cel2">월 수입 : ${list3. importhap}</span>
						<span id="cel3">월 지출 : ${list3.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list4}" var="list4">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">4월</span>
						<span id="cel2">월 수입 : ${list4. importhap}</span>
						<span id="cel3">월 지출 : ${list4.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list5}" var="list5">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">5월</span>
						<span id="cel2">월 수입 : ${list5. importhap}</span>
						<span id="cel3">월 지출 : ${list5.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list6}" var="list6">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">6월</span>
						<span id="cel2">월 수입 : ${list6. importhap}</span>
						<span id="cel3">월 지출 : ${list6.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list7}" var="list7">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">7월</span>
						<span id="cel2">월 수입 : ${list7. importhap}</span>
						<span id="cel3">월 지출 : ${list7.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list8}" var="list8">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">8월</span>
						<span id="cel2">월 수입 : ${list8. importhap}</span>
						<span id="cel3">월 지출 : ${list8.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list9}" var="list9">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">9월</span>
						<span id="cel2">월 수입 : ${list9. importhap}</span>
						<span id="cel3">월 지출 : ${list9.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list10}" var="list10">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">10월</span>
						<span id="cel2">월 수입 : ${list10. importhap}</span>
						<span id="cel3">월 지출 : ${list10.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list11}" var="list11">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">11월</span>
						<span id="cel2">월 수입 : ${list11. importhap}</span>
						<span id="cel3">월 지출 : ${list11.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
				<c:forEach items="${list12}" var="list12">
					<div class="row">
						<div class="cell">
           					 <span id="cel1">12월</span>
						<span id="cel2">월 수입 : ${list12. importhap}</span>
						<span id="cel3">월 지출 : ${list12.expensehap}</span>
					</div>
					</div>	
				</c:forEach>
		<jsp:include page="menu3.jsp"></jsp:include>
	</body>
	<script>
	</script>
</html>