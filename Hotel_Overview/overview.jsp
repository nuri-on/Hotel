<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*;"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../termProject/HotelReservationStyle.css" type="text/css" media=all />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Over View</title>
</head>
<body>
<div align=center><br> <br>
		<b><font size=20>OVERVIEW</font></b><br> <hr>
<%
Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;

String hotel_id = request.getParameter("hotel_id");
session.setAttribute("hotel_id", hotel_id);

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/hotel_test";

try {
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url, "root", "Jjsj6221");
	
	String sql = "select * from hotel where hotel_id=?";
	
	String managerName = "select name from manager where manager_id=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, hotel_id); // 호텔아이디 세션값 받아오기
	pstmt2 = conn.prepareStatement(managerName);
	pstmt2.setInt(1, 1); // 매니저아이디 세션값 받아오기
	
	ResultSet rs = pstmt.executeQuery();
	ResultSet rs2 = pstmt2.executeQuery();
	
	int i = 1;
	int j = 1;
	
	while (rs.next()) {
%>
<br>

<table border="1" width=600>
	<tr align=center>
		<th colspan=4>Basic Information</th> 
	</tr>
	<tr align=center>
		<td rowspan=3 colspan=2 width=300><img src="<%=rs.getString("image")%>" width=300></td>
		<th>Name</th>
		<td><%=  rs.getString("name")%></td>
	</tr>
	<tr align=center>
		<th>Location</th>
		<td><%=  rs.getString("location")%></td>
	</tr>
	<tr align=center>
		<th>Overview</th>
		<td><%=rs.getString("overview") %></td>
	</tr>
	<tr align=center>
		<th colspan=4>Room Information</th>
	</tr>
	<tr align=center>
		<th rowspan=2>Single</th>
		<th>Number</th>
		<td colspan=2><%= rs.getInt("room_single")%></td>
	</tr>
	<tr align=center>
		<th>Cost</th>
		<td colspan=2><%= rs.getInt("room_single_cost")%></td>
	</tr>
	<tr align=center>
		<th rowspan=2>Double</th>
		<th>Number</th>
		<td colspan=2><%= rs.getInt("room_double")%></td>
	</tr>
	<tr align=center>
		<th>Cost</th>
		<td colspan=2><%= rs.getInt("room_double_cost")%></td>
	</tr>
	<tr align=center>
		<th rowspan=2>Suite</th>
		<th>Number</th>
		<td colspan=2><%= rs.getInt("room_suite")%></td>
	</tr>
	<tr align=center>
		<th>Cost</th>
		<td colspan=2><%= rs.getInt("room_suite_cost")%></td>
	</tr>
	<tr align=center>
		<th colspan=4>SNS</th>
	</tr>
	<tr align=center>
		<th>Facebook</th>
		<td colspan=3><%=rs.getString("facebook")%></td>
	</tr>
	<tr align=center>
		<th>Twitter</th>
		<td colspan=3><%=rs.getString("twitter")%></td>
	</tr>
</table>
<%
		i++;
	}
	pstmt.executeUpdate();
	
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
			pstmt2.close();
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
</div>
</body>
</html>