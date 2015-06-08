
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"
	import="qnaComment.dao.QnaCommentDao"
	import="qnaComment.model.QnaComment"
	import="qnaComment.command.QnaCommentCommand" %>

<!-- Develope by nuriOn on 2014.05.30 -->

<%
	QnaDao qnaDao = new QnaDao();

	Qna qna = new Qna();
	
	qna.setQna_id(Integer.parseInt(request.getParameter("qnaId")));
	qna.setTitle(request.getParameter("title"));
	qna.setCategory(request.getParameter("category"));
	qna.setQna_contents(request.getParameter("contents"));
	
	int qnaId = qna.getQna_id();
	int hotelId = Integer.parseInt(request.getParameter("hotelId"));
	
	try {
		qnaDao.updateQna(qna);
		out.print("<script>alert('modify completed'); location.href='/Hotel/hotel/qna/qna.jsp?id=" + qnaId + "&hotelId=" + hotelId + "';</script>");
	}
	catch(Exception e) {
		out.print("<script>alert('modify failed'); history.go(-1);</script>");
	}
%>
