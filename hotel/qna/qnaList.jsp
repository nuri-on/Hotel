<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.command.QnaCommand"
	import="qna.dao.QnaDao" import="qna.model.Qna"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Develope by nuriOn on 2014.05.30 -->

<%
	request.setCharacterEncoding("UTF-8");

	int p = Integer.parseInt(request.getParameter("p"));
	int offset = 8;

	//int hotelId = Integer.parseInt(request.getParameter("hotelId")
			//.toString());
	//System.out.println("hotelId              " + hotelId);
	int hotelId = Integer.parseInt(session.getAttribute("hotel_id")
			.toString());
	 

	int userId = 0;
	
	int managerId = 0;

	Integer.parseInt(session.getAttribute("Manager_id").toString());

	Enumeration<String> sessionAtts = session.getAttributeNames();

	while (sessionAtts.hasMoreElements()) {
		String s = sessionAtts.nextElement().toString();
		if (s.equals("User_id")) {
			userId = Integer.parseInt(session.getAttribute("User_id")
					.toString());
			System.out.println("user " + userId);
		} else if (s.equals("Manager_id")) {
			managerId = Integer.parseInt(session.getAttribute(
					"Manager_id").toString());
			System.out.println("manager " + managerId);									
		} else
			continue;
	}

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

	String keyword = "";

	if (request.getParameter("keyword") != null) {
		keyword = request.getParameter("keyword");
		System.out.println(request.getParameter("keyword"));
	}

	QnaDao qnaDao = new QnaDao();

	QnaCommand qnaCommand = new QnaCommand();
	qnaCommand.setOffset((p - 1) * offset);
	qnaCommand.setLimit(offset);
	qnaCommand.setHotelId(hotelId);

	if (keyword.length() > 0 || keyword != null) {
		qnaCommand.setSearch(keyword);
	}

	ArrayList<Qna> qnas = qnaDao.getQnas2(qnaCommand);
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A p</title>
<link rel="stylesheet" href="../../termProject/HotelReservationStyle.css" type="text/css" media=all />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
<script>
	function goSearch() {
		location.href = '/Hotel/hotel/qna/qnaList.jsp?p=1&hotelId='
				+ <%=hotelId%> + '&keyword=' + $('#keyword').val();
	}
</script>
</head>
<body>
	<div align="center">
	<br> <br>
		<b><font size=20>Q&A</font></b><br> <hr>
		<form name="search_bar" method="post">
		<input type="hidden" id="hotelId" val=<%=hotelId%>> <input
				type="hidden" id="userId" val=<%=userId%>> <input
				type="hidden" id="managerId" val=<%=managerId%>>
			<input type="text" size="50" name="keyword" id="keyword"> <input
				type="button" value="search" onclick="goSearch();">
			<hr>
			
		</form>
		<table border="1" width=900>
			<tr>
				<th width=50>Number</th>
				<th width=100>Category</th>
				<th width=600>Title</th>
				<th width=150>Name</th>
				<th width=100>Date</th>
			</tr>
			<%
				for (Qna qna : qnas) {
			%>
			<tr align=center>
				<td><%=qna.getQna_id()%></td>
				<td><%=qna.getCategory()%></td>
				<td>
					<%
						if (userId == 0 && managerId == 0) {
					%> <a href="javascript: return false;"
					onclick="alert('you have to login to access!');"> <%
 	} else {
 %><a href="qna.jsp?hotelId=<%=hotelId%>&id=<%=qna.getQna_id()%>"> <%
 	}
 %><%=qna.getTitle()%></a>
				</td>
				<td><%=qnaDao.getUserName(qna.getUser_id())%></td>
				<td><%=qna.getDate()%></td>
			</tr>
			<%
				}
			%>





		</table>

		<div align="center">
			<a href="qnaList.jsp?hotelId=<%=hotelId%>&p=1">1</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=2">2</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=3">3</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=4">4</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=5">5</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=6">6</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=7">7</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=8">8</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=9">9</a>&nbsp;<a
				href="qnaList.jsp?hotelId=<%=hotelId%>&p=10">10</a>
		</div>

	</div>






	<!-- 
	<form name="from1" method="post">
		<input type="text" name="title"> <input type="text"
			name="user_id"> <input type="submit" value="등록">
	</form> -->
	<%
		if (userId != 0) {
	%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="write"
		onclick="location.href='/Hotel/hotel/qna/qnaRegister.jsp?hotelId=<%=hotelId%>'">
	<%
		}
	%>


</body>
</html>