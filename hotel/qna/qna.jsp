
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"
	import="qnaComment.dao.QnaCommentDao"
	import="qnaComment.model.QnaComment"
	import="qnaComment.command.QnaCommentCommand"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Develope by nuriOn on 2014.05.30 -->

<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));

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

	QnaDao qnaDao = new QnaDao();

	Qna qna = qnaDao.getQna(id);

	QnaCommentDao qnaCommentDao = new QnaCommentDao();

	QnaCommentCommand qnaCommentCommand = new QnaCommentCommand();
	qnaCommentCommand.setQna_id(id);

	ArrayList<QnaComment> qnaComments = qnaCommentDao
			.getQnaComments(qnaCommentCommand);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Insert title</title>
<link rel="stylesheet" href="../../termProject/HotelReservationStyle.css" type="text/css" media=all />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
<script>
function changeComment(id) {
	$('#comment-' + id).prop('disabled', '');
}

function updateComment(id) {
	$('#comment-' + id).prop('disabled', 'disabled');
	location.href = '/Hotel/hotel/qna/updateComment.jsp?commentId=' + id + '&contents=' + $('#comment-' + id).val();
}

function insertComment(managerId, qnaId) {
	location.href = '/Hotel/hotel/qna/insertComment.jsp?managerId=' + managerId + '&qnaId=' + qnaId +'&contents=' + $('#comment').val();
}

function deleteQna(id) {
	answer = confirm("Do you really want to delete? ");
	if (answer == true) {
		location.href = '/Hotel/hotel/qna/deleteQna.jsp?qnaId=' + id;
	}
}

function loc(p1, p2) {
	 location.href = 'qna.jsp?hotelId='+p1+'&id='+p2;
}


</script>

</head>
<body>
	<div align="center">
		<table border="1" width=1000>
			<tr>
				<th width=200>Title</th>
				<td><%=qna.getTitle()%></td>
				<th width=100>Category</th>
				<td width=100><%=qna.getCategory()%></td>
			</tr>
			<tr height=300>
				<th>Contents</th>
				<td colspan="3"><%=qna.getQna_contents()%></td>
			</tr>
			<tr>
				<form name="form1" method="post"
					action="qna.jsp?id=<%=qna.getQna_id()%>">

					<input type="hidden" name="qna_id" value=<%=qna.getQna_id()%>>
					<input type="hidden" name="manager_id" value="<%=managerId%>">
					<td colspan="4">Comment | <%
 	if (managerId != 0) {
 %>
						 <input type="text" size="100" name="comment_contents"
						id="comment"> <input type="button" value="Register" onClick="insertComment(<%=managerId%>, <%=qna.getQna_id()%>)"><hr>
						<%
							}
						%> <%
 	for (QnaComment qnaComment : qnaComments) {
 %> <%=qnaComment.getManagerId()%>&nbsp; <input
						id="comment-<%=qnaComment.getComment_id()%>" type="text"
						value="<%=qnaComment.getComment_contents()%>" disabled="disabled"
						style="border: 0px; background: silver; color: black;" /> <%
 	if (qnaComment.getManager_id() == managerId) {
 %> <input type="button" value="수정"
						onclick="changeComment(<%=qnaComment.getComment_id()%>)" /> <input
						type="button" value="확인"
						onclick="updateComment(<%=qnaComment.getComment_id()%>)" /> <%
 	}
 %> <br> <%
 	}
 %>
					</td>
				</form>
			</tr>
		</table>
		<input type="button" value="List" align="left"
			onclick="location.href='/Hotel/hotel/qna/qnaList.jsp?p=1&hotelId=<%=hotelId%>'">

		<%
			if (qna.getUser_id() == userId) {
		%>


		<input type="button" value="Modify" align="right"
			onclick="location.href='/Hotel/hotel/qna/qnaRegister.jsp?qnaId=<%=qna.getQna_id()%>&hotelId=<%=hotelId%>'">
		<input type="button" value="Delete" align="right"
			onclick="deleteQna(<%=qna.getQna_id()%>);">

		<%
			}
		%>



	</div>

	</title>
</head>
<body>


</body>
</html>