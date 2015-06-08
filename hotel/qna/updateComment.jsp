
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="qnaComment.model.QnaComment"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"
	import="qnaComment.dao.QnaCommentDao"
	import="qnaComment.model.QnaComment"
	import="qnaComment.command.QnaCommentCommand" %>

<!-- Develope by nuriOn on 2014.05.30 -->

<%
	QnaCommentDao qnaCommentDao = new QnaCommentDao();

	QnaComment qnaComment = new QnaComment();
	
	qnaComment.setComment_id(Integer.parseInt(request.getParameter("commentId")));
	qnaComment.setComment_contents(request.getParameter("contents"));

	try {
		qnaCommentDao.updateQnaComment(qnaComment);
		out.print("<script>alert('update completed'); history.go(-1);</script>");
	}
	catch(Exception e) {
		out.print("<script>alert('update failed'); history.go(-1);</script>");
	}
%>
