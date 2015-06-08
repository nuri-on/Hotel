
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" errorPage="qnaError.jsp"
	import="java.util.*" import="qna.dao.QnaDao" import="qna.model.Qna"%>

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
	QnaDao qnaDao = new QnaDao();

	Qna qna = new Qna();

	qna.setUser_id(userId);
	qna.setHotel_id(hotelId);
	qna.setCategory(request.getParameter("category"));
	qna.setDate(request.getParameter("date"));
	qna.setQna_contents(request.getParameter("contents"));
	qna.setTitle(request.getParameter("title"));

	long lastInsertId = 0;

	try {
		lastInsertId = qnaDao.insertQna(qna);
		out.print("<script>alert('insert completed'); location.href='/Hotel/hotel/qna/qna.jsp?id="
				+ lastInsertId + "';</script>");
	} catch (Exception e) {
		out.print("<script>alert('insert failed'); history.go(-1);</script>");
	}
%>
