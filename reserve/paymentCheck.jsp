<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*;"%>
	<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %> <!-- 커스텀 태그 사용 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PaymentCheck</title>
<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />
</head>
<body>
<%
session.setAttribute("cvc", request.getParameter("cvc"));
session.setAttribute("cardpwd", request.getParameter("cardpwd"));
session.setAttribute("expireYear", request.getParameter("expireYear"));
session.setAttribute("cardNumber", request.getParameter("cardNumber"));
session.setAttribute("cardType", request.getParameter("cardType"));
session.setAttribute("userName", request.getParameter("userName"));
session.setAttribute("expireMonth", request.getParameter("expireMonth"));

Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/hotel_test";

try {
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url, "root", "Jjsj6221");
	
	String sql = "insert into payment(card_number, card_cvc, card_password, card_expire_year, card_expire_month, card_type, card_name) values(?,?,?,?,?,?,?)";
	
	//session.setAttribute("hotel_id", 1);
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, session.getAttribute("cardNumber").toString());
	pstmt.setInt(2, Integer.parseInt(session.getAttribute("cvc").toString()));
	pstmt.setInt(3, Integer.parseInt(session.getAttribute("cardpwd").toString()));
	pstmt.setInt(4, Integer.parseInt(session.getAttribute("expireYear").toString()));
	pstmt.setInt(5, Integer.parseInt(session.getAttribute("expireMonth").toString()));
	pstmt.setString(6, session.getAttribute("cardType").toString());
	pstmt.setString(7, session.getAttribute("userName").toString());
	pstmt.executeUpdate();
	
	int user_id = Integer.parseInt(session.getAttribute("User_id").toString());
	int hotel_id = Integer.parseInt(session.getAttribute("hotel_id").toString());
	
	
	
	String sql2 = "insert into reservation(user_id, hotel_id, reservation_date, reservation_date2, room_type, payment_id, day, total_cost) values(?,?,?,?,?,?,?, ?)";
	pstmt2 = conn.prepareStatement(sql2);
	pstmt2.setInt(1, user_id); // 회원아이디 세션값 받아오기
	pstmt2.setInt(2, hotel_id); // 호텔아이디 세션값 받아오기
	pstmt2.setString(3, session.getAttribute("reservation_date").toString());
	pstmt2.setString(4, session.getAttribute("reservation_date2").toString());
	pstmt2.setString(5, session.getAttribute("room_type").toString().trim());
	pstmt2.setInt(6, 1); // 페이먼트 아이디
	pstmt2.setInt(7, Integer.parseInt(session.getAttribute("total_day").toString()));	
	pstmt2.setInt(8, Integer.parseInt(session.getAttribute("total_cost").toString()));
	pstmt2.executeUpdate();
%>
<center><mytag:titleEffect>Congratulation!</mytag:titleEffect></center>
<table align = "center" border = "1">
<tr><th align = "center" width = "500" height = "30"><font color = "blue" size = 3><mytag:titleEffect>++++++ Booking Information ++++++</mytag:titleEffect></font></th></tr>
<tr><td align = "center" height = "30">Booking hotel : <% 
String hotelName = "select name from hotel where hotel_id=" + session.getAttribute("hotel_id");
pstmt2 = conn.prepareStatement(hotelName);
ResultSet rs = pstmt2.executeQuery();

int i = 1;
String reservedHotel = "";

while (rs.next()) {
	reservedHotel = rs.getString("name");						
	i++;
};
out.println(reservedHotel);
%></td></tr>
<tr><td align = "center" height = "30">Booking Name : <%= session.getAttribute("userName") %></td></tr>
<tr><td align = "center" height = "30">Booking Start Day : <%= session.getAttribute("reservation_date") %></td></tr>
<tr><td align = "center" height = "30">Booking End Day : <%= session.getAttribute("reservation_date2") %></td></tr>
<tr><td align = "center" height = "30">Total Date of Stay : <%= session.getAttribute("total_day") %></td></tr>
<tr><td align = "center" height = "30">Room Type: <%= session.getAttribute("room_type") %></td></tr>
<tr><th align = "center" height = "30"><font color = "blue" size = 3><mytag:titleEffect>++++++ Reservation Information ++++++</mytag:titleEffect></font></th></tr>
<tr><td align = "center" height = "30">Card Type : <%= session.getAttribute("cardType") %> card</td></tr>
<tr><td align = "center" height = "30">Card Number : <%= session.getAttribute("cardNumber") %></td></tr>
</table>
<%
if(pstmt != null) {
	try {
		pstmt.close();
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
}
if(pstmt2 != null) {
	try {
		pstmt.close();
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
}
if(conn != null) {
	try {
		conn.close();
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
}

} catch (Exception e) {
System.out.println(e);
}
%>
</body>
</html>