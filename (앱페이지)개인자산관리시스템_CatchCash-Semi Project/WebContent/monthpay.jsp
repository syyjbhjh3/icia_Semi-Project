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
}
td,table{
		border-collapse: collapse;
		text-align: center;
	}
thead{
	font-size: 14px;
	font-weight: 800;
	color: #ffffff;
	background: #2980b9;
	border: 1px solid #2980b9;
	/*background: #f6f6f6; 전체 매끈한 색깔*/
}
tbody td{
	border:1px solid #E6E6E6;
	font-size: 14px;
	background: #FAFAFA;
}

</style>
</head>
	<body>
		<jsp:include page="aftercalendar.jsp"/><br/><br/><br/><br/>
		<form action="monthpay" method="post">
			<input type="text" name="month" placeholder="ex) 2017"/>
			<input type="submit" value="보기"/> 
		</form>
				<table style="width:100%;">
					<thead>
					<tr >
					      <td >월</td>
					      <td >수입 및 지출</td>
					</tr>
					</thead>
					<tbody>
				<c:forEach items="${list1}" var="list1">
						<tr >
           				<td  rowspan="2">1월</td>
						<td >월 수입 : ${list1.importhap}</td>
						</tr>
						<tr>
						<td >월 지출 : ${list1.expensehap}</td>
						</tr>
				</c:forEach>
				<c:forEach items="${list2}" var="list2">
						<tr >
           					<td rowspan="2">2월</td>
							<td >월 수입 : ${list2. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list2.expensehap}</td>
						</tr>
				</c:forEach>
				<c:forEach items="${list3}" var="list3">
					<tr >
           					<td rowspan="2">3월</td>
							<td >월 수입 : ${list3. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list3.expensehap}</td>
						</tr>	
				</c:forEach>
				<c:forEach items="${list4}" var="list4">
					<tr >
           					<td rowspan="2">4월</td>
							<td >월 수입 : ${list4. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list4.expensehap}</td>
						</tr>
				</c:forEach>
				<c:forEach items="${list5}" var="list5">
					<tr >
           					<td rowspan="2">5월</td>
							<td >월 수입 : ${list5. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list5.expensehap}</td>
						</tr>
				</c:forEach>
				<c:forEach items="${list6}" var="list6">
					<tr >
           					<td rowspan="2">6월</td>
							<td >월 수입 : ${list6. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list6.expensehap}</td>
						</tr>
				</c:forEach>
				<c:forEach items="${list7}" var="list7">
					<tr >
           					<td rowspan="2">7월</td>
							<td >월 수입 : ${list7. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list7.expensehap}</td>
						</tr>
				</c:forEach>
				<c:forEach items="${list8}" var="list8">
					<tr >
           					<td rowspan="2">8월</td>
							<td >월 수입 : ${list8. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list8.expensehap}</td>
						</tr>	
				</c:forEach>
				<c:forEach items="${list9}" var="list9">
					<tr >
           					<td rowspan="2">9월</td>
							<td >월 수입 : ${list9. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list9.expensehap}</td>
						</tr>	
				</c:forEach>
				<c:forEach items="${list10}" var="list10">
					<tr >
           					<td rowspan="2">10월</td>
							<td >월 수입 : ${list10. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list10.expensehap}</td>
						</tr>	
				</c:forEach>
				<c:forEach items="${list11}" var="list11">
					<tr >
           					<td rowspan="2">11월</td>
							<td >월 수입 : ${list11. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list11.expensehap}</td>
						</tr>	
				</c:forEach>
				<c:forEach items="${list12}" var="list12">
					<tr >
           					<td rowspan="2">12월</td>
							<td >월 수입 : ${list12. importhap}</td>
						</tr>
						<tr>
							<td >월 지출 : ${list12.expensehap}</td>
						</tr>	
				</c:forEach>
				</tbody>
				</table>
		<jsp:include page="menu3.jsp"></jsp:include>
	</body>
	<script>
	</script>
</html>