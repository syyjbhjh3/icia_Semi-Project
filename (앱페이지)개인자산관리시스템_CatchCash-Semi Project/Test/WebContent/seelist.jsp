<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>프로젝트</title>
		<style rel="stylesheet">
body {
  font-family: "Helvetica Neue", Helvetica, Arial;
  font-size: 14px;
  font-weight: 200;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background: #2b2b2b;
  margin: 0px;
}

.wrapper {
  margin: 0 auto;
  padding: 0px;
  max-width: 800px;
}

.table {
  margin: 0 0 40px 0;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
  width: "100%"
}
@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
}

.row {
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.green {
  background: #27ae60;
}
.cell {
  padding: 6px 30px;
  display: table-cell;
}
@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 12px;
    display: block;
  }
}
#cel1{
	margin-left: 10%;
}
#cel2{
	margin-left: 10%;
}
#cel3{
	margin-left: 10%;
}
#cel4{
	margin-left: 10%;
}
#cel5{
	margin-left: 30px;
}
#cel6{
	margin-left: 40px;
}
#cel7{
	margin-left: 40px;
}
#cel8{
	margin-left: 40px;
}

</style>
	</head>
	<body>
		<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/>
		 <b><p>Today : ${reg}</p></b>
		<div id="search">
		<form action="seelist" method="get">
			<select name="reg_date">
				<c:forEach items="${reglist}" var="reglist">
					<option value="${reglist}">${reglist}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="user_id" value="${sessionScope.loginId}"/>
			<input type="submit" value="검색" class="button"/>
		</form>
		</div>
  			<div class="table">
				<div class="row header green">
				      <div class="cell">
				        <span id="cel5">Part</span>
				        <span id="cel6">Kind</span>
				        <span id="cel7">Money</span>
				        <span id="cel8">Content</span> 
				      </div>
				    </div>	
					<c:forEach items="${list}" var="list">
						 <div class="row">
						      <div class="cell2">
						      	<span id="cel1">${list.part}</span>
						     	<span id="cel2">${list.kind }</span>						      
						       	<span id="cel3">${list.money} 원</span>
						        <span id="cel4">${list.content}</span>
						      </div>
						    </div>
					</c:forEach>
					</div>
			<jsp:include page="menu2.jsp"></jsp:include>
		</body>
	<script>
	</script>
</html>