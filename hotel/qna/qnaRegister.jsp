
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.command.QnaCommand"
	import="qna.dao.QnaDao" import="qna.model.Qna" import="java.util.Date"
	import="java.text.SimpleDateFormat"%>

<!-- Develope by nuriOn on 2014.05.30 -->

<%
	int hotelId = Integer.parseInt(session.getAttribute("hotel_id")
			.toString());

	int userId = Integer.parseInt(session.getAttribute("User_id")
			.toString());
	int managerId = Integer.parseInt(session.getAttribute("Manager_id")
			.toString());
	;

	/* 	Enumeration<String> sessionAtts = session.getAttributeNames();

	 while (sessionAtts.hasMoreElements()) {
	
	 if (sessionAtts.nextElement().equals("userId")) {
	 userId = Integer.parseInt(session.getAttribute("userId")
	 .toString());
	 System.out.println("user " + userId);
	 if (userId != 0)
	 break;
	 } else if (sessionAtts.nextElement().equals("managerId")) {
	 managerId = Integer.parseInt(session.getAttribute(
	 "managerId").toString());
	 System.out.println("manager " + managerId);
	 if (managerId != 0)
	 break;
	 } else
	 continue;
	 }
	 */
	System.out.println("hotelId = " + hotelId);
	System.out.println("userId = " + userId);
	System.out.println("managerId = " + managerId);

	request.setCharacterEncoding("UTF-8");

	int qnaId;
	QnaDao qnaDao = new QnaDao();
	Qna qna = new Qna();

	if (request.getParameter("qnaId") != null) {
		qnaId = Integer.parseInt(request.getParameter("qnaId"));
		qna = qnaDao.getQna(qnaId);
		System.out.println(qnaId);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../termProject/HotelReservationStyle.css" type="text/css" media=all />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A Register</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
<script>
function insertQna() {
	var hotelId = $('#hotelId').val();
	var userId = $('#userId').val();
	var category = $("#category option:selected").val();
	var date = $('#date').val().split(' ')[0];
	var contents = $('#contents').val().replace(/\n/g, '<br>');
	var title = $('#title').val();
	location.href = '/Hotel/hotel/qna/insertQna.jsp?userId=' + userId + '&hotelId=' + hotelId + '&category=' + category + '&date=' + date + '&contents=' + contents + '&title=' + title;
}

function updateQna(qnaId) {
	var hotelId = $('#hotelId').val();
	var userId = $('#userId').val();
	var category = $("#category option:selected").val();
	var contents = $('#contents').val().replace(/\n/g, '<br>');
	var title = $('#title').val();
	
	location.href = '/Hotel/hotel/qna/updateQna.jsp?qnaId=' + qnaId + '&hotelId=' + hotelId + '&category=' + category + '&contents=' + contents + '&title=' + title;
}
</script>
<link rel="stylesheet" type="text/css" href="hotel.css" />
</head>
<body>

	<form name="form1" method="post" action="qnaList.jsp?p=1">
		<%
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			String currentDate = formatter.format(date);
		%>
		<input id="date" type="hidden" name="date" value="<%=currentDate%>">
		<input type="hidden" name="user_id" value="<%=userId%>"> <input
			id="hotelId" type="hidden" name="hotel_id" value="<%=hotelId%>">
		<input id="userId" type="hidden" name="hotel_id" value="<%=userId%>">
		<!-- <%=request.getParameter("hotelId")%> -->
		<div align="center">
			<table border="1">
				<tr align=center>
					<td>Title</td>
					<td>
						<%
							if (request.getParameter("qnaId") != null) {
						%> <input id="title" type="text" name="title" size="90"
						value="<%=qna.getTitle()%>"> <%
 	} else {
 %> <input id="title" type="text" name="title" size="90"> <%
 	}
 %>
					</td>
					<td><select id="category" name="category"><option
								selected="selected" value="reservation">Reservation</option>
							<option value="refund">Refund</option>
							<option value="homepage">Homepage</option>
							<option value="etc">Etc</option></select></td>
				</tr>
				<tr align=center>
					<td>Contents</td>
					<td colspan="2">
						<%
							if (request.getParameter("qnaId") != null) {
						%> <textarea id="contents" rows="10" cols="100" name="qna_contents"><%=qna.getQna_contents().replaceAll("<br>", "\r\n")%></textarea>
						<%
							} else {
						%> <textarea id="contents" rows="10" cols="70" name="qna_contents"></textarea>
						<%
							}
						%>





					</td>
				</tr>

			</table>

			<input type="button" value="List" align="left"
				onclick="location.href = '/Hotel/hotel/qna/qnaList.jsp?p=1&hotelId=<%=hotelId%>';">
			<input type="button" value="Cancel" align="left"
				onclick="history.go(-1)";">


			<%
				if (request.getParameter("qnaId") == null) {
			%>
			<input type="reset" value="Reset" align="right">

			<%
				}
			%>




			<%
				if (request.getParameter("qnaId") != null) {
			%>
			<input type="button" value="Modify" align="right"
				onclick="updateQna(<%=request.getParameter("qnaId")%>);">
			<%
				} else {
			%>
			<input type="button" value="Register" align="right"
				onclick="insertQna();">
			<%
				}
			%>

		</div>

	</form>



</body>
</html>