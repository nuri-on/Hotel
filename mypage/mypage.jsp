<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*;"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="../termProject/HotelReservationStyle.css" type="text/css" media=all />
</head>
<body>
	<center>
		<h2><font size=50>My Reservation</font></h2>
	</center>
	<hr>
	<br>
	<br>
	<%
		Enumeration<String> sessionAtt = session.getAttributeNames();

		int Muser_Id = 0;
		int user_Id = 0;

		while (sessionAtt.hasMoreElements()) {
			String s = sessionAtt.nextElement();

			if (s.equals("User_id")) {				
				user_Id = Integer.parseInt(session.getAttribute("User_id")
						.toString());
				
			} else if (s.equals("Manager_id")) {
				Muser_Id = Integer.parseInt(session.getAttribute("Manager_id")
						.toString());
				System.out.print(Muser_Id);
			}
		}

		Connection conn = null;
		PreparedStatement pstmt = null;

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/hotel_test";

		try {
			Class.forName(jdbc_driver);

			conn = DriverManager
					.getConnection(jdbc_url, "root", "Jjsj6221");

			if (user_Id == 0) { // 매니저일 경우
				String hotelsql = "select hotel_id from hotel where manager_id="
						+ Muser_Id;
				pstmt = conn.prepareStatement(hotelsql);
			
				ResultSet rs2 = pstmt.executeQuery();

				int j = 1;
				int hotel_num = 0;
				
				while (rs2.next()) {					
					hotel_num = rs2.getInt("hotel_id");
					j++;
				}
				
				System.out.println(hotelsql);
				String sql2 = "select * from reservation where hotel_id="
						+ hotel_num;

				pstmt = conn.prepareStatement(sql2);
				ResultSet rs = pstmt.executeQuery();

				int i = 1;

				out.println("<table border = '1' align = 'center'>");
				out.println("<tr>");
				out.println("<th align = 'center'>Reservation No.</td>");
				out.println("<th align = 'center'>User ID</td>");
				out.println("<th align = 'center'>Reservation Start Day</td>");
				out.println("<th align = 'center'>Reservation End Day</td>");
				out.println("<th align = 'center'>Room Type</td>");
				out.println("<th align = 'center'>Total Date of Stay</td>");
				out.println("<th align = 'center'>Total Cost</td>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td align = 'center'>No. " + i
							+ "</td><td align = 'center'>"
							+ rs.getString("user_id") + "</td><td align = 'center'>"
							+ rs.getString("reservation_date")
							+ "</td><td align = 'center'>"
							+ rs.getString("reservation_date2")
							+ "</td><td align = 'center'>"
							+ rs.getString("room_type")
							+ "</td><td align = 'center'>"
							+ rs.getString("day")
							+ "</td><td align = 'center'>"
							+ rs.getString("total_cost") + "</td>");
					out.println("</tr>");
					i++;
				}
				out.println("</table>");
				rs.close();
			} else { // 회원아이디
				String sql = "select * from reservation where user_id=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, user_Id); // 유저아이디 세션값 받아오기
				ResultSet rs = pstmt.executeQuery();

				int i = 1;

				out.println("<table border = '1' align = 'center'>");
				out.println("<tr>");
				out.println("<th align = 'center'>Reservation No.</td>");
				out.println("<th align = 'center'>Reservation Start Day</td>");
				out.println("<th align = 'center'>Reservation End Day</td>");
				out.println("<th align = 'center'>Room Type</td>");
				out.println("<th align = 'center'>Total Date of Stay</td>");
				out.println("<th align = 'center'>Total Cost</td>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td align = 'center'>No. " + i
							+ "</td><td align = 'center'>"
							+ rs.getString("reservation_date")
							+ "</td><td align = 'center'>" +

							rs.getString("reservation_date2")
							+ "</td><td align = 'center'>"
							+ rs.getString("room_type")
							+ "</td><td align = 'center'>"
							+ rs.getString("day") +

							"</td><td align = 'center'>"
							+ rs.getString("total_cost") + "</td>");
					out.println("</tr>");
					i++;
				}
				out.println("</table>");
				rs.close();
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body>
</html>