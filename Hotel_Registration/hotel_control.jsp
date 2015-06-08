<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="ab" class="hotel.regHotel.HotelBean" scope="page"/>
<jsp:useBean id="hotelBook" class="hotel.regHotel.HotelBook" />
<jsp:setProperty name="hotelBook" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
%>



<%
	String action = request.getParameter("action");
	if (action.equals("list")) {

	} else if (action.equals("insert")) {
		if (ab.insertDB(hotelBook)) {
			//response.sendRedirect("hotel_control.jsp?action=list");
			System.out.println("호텔 등록 성공!");
		}
		response.sendRedirect("../Hotel_Index/indexFrame2.html");
	} else if (action.equals("edit")) {

	} else if (action.equals("update")) {

	} else if (action.equals("delete")) {

	} else {

	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>