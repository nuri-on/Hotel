
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"
	import="qnaComment.dao.QnaCommentDao"
	import="qnaComment.model.QnaComment"
	import="qnaComment.command.QnaCommentCommand"%>

<!-- Develope by nuriOn on 2014.05.30 -->
<script>
function loc(p1, p2) {
	 location.href = 'qna.jsp?hotelId='+p1+'&id='+p2;
}
</script>

<%

	String qna_id = request.getParameter("qnaId");
	int hotelId = Integer.parseInt(session.getAttribute("hotel_id")
		.toString());

	QnaCommentDao qnaCommentDao = new QnaCommentDao();

	QnaComment qnaComment = new QnaComment();

	qnaComment.setManager_id(Integer.parseInt(request
			.getParameter("managerId")));
	qnaComment
			.setQna_id(Integer.parseInt(request.getParameter("qnaId")));
	qnaComment.setComment_contents(request.getParameter("contents"));

	try {
		qnaCommentDao.insertQnaComment(qnaComment);
		//out.print("<script>alert('insert completed'); history.go(-1);</script>");
		out.print("<script>alert('insert completed');</script>");
		response.sendRedirect("qna.jsp?hotelId="+hotelId+"&id="+qna_id);
		
	} catch (Exception e) {
		out.print("<script>alert('insert failed'); history.go(-1);</script>");
	}
%>
