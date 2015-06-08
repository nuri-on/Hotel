
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Develope by nuriOn on 2014.05.30 -->

<%
 	//session.setAttribute("hotel_id", 1);
/*	session.setAttribute("User_id", 0);
	session.setAttribute("Manager_id", 1);
 */
	int hotelId = Integer.parseInt(session.getAttribute("hotel_id")
			.toString());
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
<script>
	function go() {
		var hotelId = $('#hotelId').val();
		var userId = $('#userId').val();
		var managerId = $('#managerId').val();
		location.href = '/Hotel/hotel/qna/idSetting.jsp?hotelId=' + hotelId
				+ '&userId=' + userId + '&managerId=' +	managerId;
	}
</script>
</head>
<body>
	Insert Hotel id :
	<input type="text" id="hotelId">
	<br> Insert User id :
	<input type="text" id="userId">
	<br> Insert Manager id :
	<input type="text" id="managerId">
	<br>
	<input type="button" onclick="go()" value="Enter">

</body>
</html>