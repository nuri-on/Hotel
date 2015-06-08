
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"%>
<!-- Develope by nuriOn on 2014.05.30 -->
<link rel="stylesheet" href="../../termProject/HotelReservationStyle.css" type="text/css" media=all />
<%
	QnaDao qnaDao = new QnaDao();

	Qna qna = new Qna();

	qna.setQna_id(Integer.parseInt(request.getParameter("qnaId")));

	qnaDao.deleteQna(qna.getQna_id());
	try {
		out.print("<script>alert('delete completed'); location.href='/Hotel/hotel/qna/qnaList.jsp?p=1&hotelId=1';</script>");
	} catch (Exception e) {
		out.print("<script>alert('delete failed'); history.go(-1);</script>");
	}
%>
