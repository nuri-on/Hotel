<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); 
int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
int i;%>
 <div id="menustyle">
 	<ul id="navlist">
 		<li><a href="../Hotel_Index/indexFrame2.html" target="_parent"><img src="../Image/sublogo.png" width=80 style="background-color:white;"></a></li>
	 	<li id="active"><a href="../Hotel_Overview/overview.jsp?hotel_id=<%=hotel_id%>" target="contents">OVERVIEW</a></li>
		 <li><a href="../reserve/booking_start.jsp" target="contents">BOOK</a></li>
		 <li><a href="../hotel/qna/qnaList.jsp?p=1" target="contents">Q&A</a></li>
		 <li><a href="../Hotel_Review/review_index.jsp?hotel_id=<%=hotel_id%>" target="contents">REVIEW</a></li>
	 </ul>
 </div>
</body>
</html>