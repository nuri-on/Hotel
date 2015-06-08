<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.StringTokenizer, java.util.Calendar;"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment</title>
<%
//session.setAttribute("hotel_id", 1); // 호텔세션 더미데이터!
System.out.println(request.getParameter("quickRoom"));
if (request.getParameter("quickRoom") == null) {  // 퀵북 세션이 없을때
	session.setAttribute("room_type", request.getParameter("roomType"));
} else { // 퀵북 세션이 있을 때
	String start = request.getParameter("startDate").toString();
	String end = request.getParameter("endDate").toString();
	String room = request.getParameter("quickRoom").toString();
	
	System.out.println(start);
	System.out.println(end);
	session.setAttribute("reservation_date", start);
	session.setAttribute("reservation_date2", end);
	
	System.out.println(room);
	
	session.setAttribute("room_type", room); // 방 종류 세션
	
	StringTokenizer str = new StringTokenizer(start, "-"); // 시작날짜 분리
	int i = 0;
	int sYear = 0, sMonth = 0, sDate = 0;
	while(str.hasMoreTokens())
	{
		if (i == 0) {
			sYear = Integer.parseInt(str.nextToken());
		} else if (i == 1) {
			sMonth = Integer.parseInt(str.nextToken());
		} else {
			sDate = Integer.parseInt(str.nextToken());
		}
		i++;
	}
	
	session.setAttribute("sYear", sYear); // 시작날짜 세션 설정
	session.setAttribute("sMonth", sMonth);
	session.setAttribute("sDate", sDate);
	
	StringTokenizer str2 = new StringTokenizer(end, "-"); // 끝날짜 분리
	int j = 0;
	int eYear = 0, eMonth = 0, eDate = 0;
	while(str2.hasMoreTokens())
	{
		if (j == 0) {
			eYear = Integer.parseInt(str2.nextToken());
		} else if (j == 1) {
			eMonth = Integer.parseInt(str2.nextToken());
		} else {
			eDate = Integer.parseInt(str2.nextToken());
		}
		j++;
	}
	
	session.setAttribute("eYear", eYear); // 끝날짜 세션 설정
	session.setAttribute("eMonth", eMonth);
	session.setAttribute("eDate", eDate);
	
	Calendar startDate = Calendar.getInstance(); //Calendar객체를 생성
	Calendar endDate = Calendar.getInstance();

	startDate.set(sYear, sMonth, sDate);
	endDate.set(eYear, eMonth, eDate);

	long resultTime = endDate.getTime().getTime() - startDate.getTime().getTime(); // 차이 구하기
	long resultDay = resultTime /(1000*60*60*24);// 일로 바꾸기
	session.setAttribute("total_day", resultDay);
}	
%>
<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />
</head>
<body>
	<center>
		<form name="payment_form" method="post" action="paymentCheck.jsp">
			<br> <br>
			<table border=1>
				<tr align="center">
					<td colspan="7">① Choose Room ▶ <font color="red"><b>②
								Payment</b></font> ▶ ③ Payment Check
					</td>
				</tr>
				<tr align="center">
					<td colspan="7">Your Choice is <%=session.getAttribute("room_type")%>
						Room
					</td>
				</tr>
				<tr align="center">
					<td colspan="7">Total Date of Stay : <%=session.getAttribute("total_day")%></td>
				</tr>
				<tr>
					<td colspan="7">
						<table>
							<tr>
								<td rowspan="7">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><br>Card Type<br></td>
								<td><br></td>
								<td rowspan="7">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2" align="center" valign="top"><input
									type="radio" name="cardType" value="visa"><img
									alt="visa" src="visa.jpg" width="100"> &nbsp;&nbsp; <input
									type="radio" name="cardType" value="master"><img
									alt="master" src="master.jpg" width="100"> &nbsp;&nbsp; <input
									type="radio" name="cardType" value="maestro"><img
									alt="maestro" src="maestro.jpg" width="100"><br> <br></td>
							</tr>
							<tr>
								<!-- 카드번호 입력 -->
								<td width="200" align="center">Card Number</td>
								<td><input type="text" name="cardNumber" size="31"
									maxlength="16"></td>
							</tr>
							<tr>
								<!-- 카드 유효기간 -->
								<td width="200" align="center">Expiration Date</td>
								<td><input type="text" name="expireYear" size="2"
									maxlength="4"> / <input type="text" name="expireMonth"
									size="2" maxlength="2"></td>
							</tr>
							<tr>
								<!-- 이름 입력 -->
								<td width="200" align="center">User Name</td>
								<td><input type="text" name="userName" size="31"></td>
							</tr>
							<tr>
								<!-- 패스워드 입력 -->
								<td width="200" align="center">Card Password</td>
								<td><input type="password" name="cardpwd" size="3"
									maxlength="2">**</td>
							</tr>
							<tr>
								<!-- CVC 입력 -->
								<td width="200" align="center">CVC</td>
								<td><input type="text" name="cvc" size="2" maxlength="3"></td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<br>Total Cost : <%
										Connection conn = null;
										PreparedStatement pstmt = null;

										String jdbc_driver = "com.mysql.jdbc.Driver";
										String jdbc_url = "jdbc:mysql://localhost/hotel_test";

										Class.forName(jdbc_driver);

										conn = DriverManager.getConnection(jdbc_url, "root", "Jjsj6221");
										
										int total_hotel_cost = 0;

										if (session.getAttribute("room_type").equals("Single")) {
											String costCheckSql = "select room_single_cost from hotel where hotel_id="
													+ session.getAttribute("hotel_id").toString();
											pstmt = conn.prepareStatement(costCheckSql);

											ResultSet rs = pstmt.executeQuery();
											int i = 1;
											String singleRoomCost = null;

											while (rs.next()) {
												singleRoomCost = rs.getString("room_single_cost");
												i++;
											};											;

											total_hotel_cost = Integer.parseInt(session.getAttribute(
													"total_day").toString())
													* Integer.parseInt(singleRoomCost);
											out.println("$" + total_hotel_cost);
											rs.close();
										} else if (session.getAttribute("room_type").equals("Double")) {
											String costCheckSql = "select room_double_cost from hotel where hotel_id="
													+ session.getAttribute("hotel_id").toString();
											pstmt = conn.prepareStatement(costCheckSql);

											ResultSet rs = pstmt.executeQuery();
											int i = 1;
											String doubleRoomCost = null;

											while (rs.next()) {
												doubleRoomCost = rs.getString("room_double_cost");
												i++;
											};

											total_hotel_cost = Integer.parseInt(session.getAttribute(
													"total_day").toString())
													* Integer.parseInt(doubleRoomCost);
											out.println("$" + total_hotel_cost);
											rs.close();
										} else if (session.getAttribute("room_type").equals("Suite")) {
											String costCheckSql = "select room_suite_cost from hotel where hotel_id="
													+ session.getAttribute("hotel_id").toString();
											pstmt = conn.prepareStatement(costCheckSql);

											ResultSet rs = pstmt.executeQuery();
											int i = 1;
											String suiteRoomCost = null;

											while (rs.next()) {
												suiteRoomCost = rs.getString("room_double_cost");
												i++;
											};

											total_hotel_cost = Integer.parseInt(session.getAttribute(
													"total_day").toString())
													* Integer.parseInt(suiteRoomCost);
											out.println("$" + total_hotel_cost);
											rs.close();
										}
										session.setAttribute("total_cost", total_hotel_cost);
									%>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" width="40"><input type="button" name="prev"
						value="prev"></td>
					<td colspan="5"></td>
					<td align="right" width="40"><input type="submit" name="next"
						value="next"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>