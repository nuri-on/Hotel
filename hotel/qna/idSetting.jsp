
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Develope by nuriOn on 2014.05.30 -->

<%
	int hotelId = Integer.parseInt(request.getParameter("hotelId")
			.toString());

	int userId = Integer.parseInt(request.getParameter("userId")
			.toString());

	int managerId = Integer.parseInt(request.getParameter("managerId")
			.toString());

	session.setAttribute("hotel_id", hotelId);
	session.setAttribute("User_id", userId);
	session.setAttribute("Manager_id", managerId);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		location.href = '/Hotel/hotel/qna/qnaList.jsp?p=1&hotelId=<%=hotelId%>';
	</script>
</body>
</html>