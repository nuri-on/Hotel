<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Choose Room</title>
<script language="javascript">
function roomSingle() {
	alert("Your Choice is Single Room!");
	document.getElementById("roomType").value = "Single";
}
function roomDouble() {
	alert("Your Choice is Double Room!");
	document.getElementById("roomType").value = "Double";
}
function roomSuite() {
	alert("Your Choice is Suite Room!");
	document.getElementById("roomType").value = "Suite";
}
</script>
<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />
</head>
<body>
<%
String sYear = session.getAttribute("sYear").toString();
String sMonth = session.getAttribute("sMonth").toString();
String sDate = session.getAttribute("sDate").toString();

String eYear = request.getParameter("yearNum2");
String eMonth = request.getParameter("monthNum2");
String eDate = request.getParameter("dateNum2");

session.setAttribute("eYear", eYear);
session.setAttribute("eMonth", eMonth);
session.setAttribute("eDate", eDate);

String endDay = eYear + "-" + eMonth + "-" + eDate;
session.setAttribute("reservation_date2", endDay);

Calendar start = Calendar.getInstance(); //Calendar객체를 생성
Calendar end = Calendar.getInstance();

start.set(Integer.parseInt(sYear), Integer.parseInt(sMonth), Integer.parseInt(sDate));
end.set(Integer.parseInt(eYear), Integer.parseInt(eMonth), Integer.parseInt(eDate));

long resultTime = end.getTime().getTime() - start.getTime().getTime(); // 차이 구하기
long resultDay = resultTime /(1000*60*60*24);// 일로 바꾸기
session.setAttribute("total_day", resultDay);
%>
	<center>
		<form name="chooseRoom" method="post" action="toPayment.jsp">
			<table>
				<!-- 플로팅 프레임 -->
				<tr>
					<td>
						<!-- 예약 프레임 -->
						<table border="1">
							<tr align="center">
								<td colspan="3"><font color ="red" ><b>① Choose Room</b></font> ▶ ② Payment ▶ ③ Payment Check</td>
							</tr>
							<tr align="center">
								<td colspan="3">Start Day : <%=sYear %>/ <%=sMonth%> / <%=sDate%>
									& End Day : <%=eYear%> / <%=eMonth%>	/ <%=eDate%></td>
							</tr>
							<tr align="center">
								<td colspan="3">Total Date of Stay : <%= resultDay %></td>
							</tr>
							<tr align="center">
								<td><input type='button' name="btnSingle"
									style='background-color: black; height: 300px; width: 300px; font-size: 40pt; font-family: "Times New Roman"; color: white'
									value="Single" onClick="roomSingle();"></td>
								<td><input type='button' name="btnDouble"
									style='background-color: black; height: 300px; width: 300px; font-size: 40pt; font-family: "Times New Roman"; color: white'
									value="Double" onClick="roomDouble();"></td>
								<td><input type='button' name="btnSuite"
									style='background-color: black; height: 300px; width: 300px; font-size: 40pt; font-family: "Times New Roman"; color: white'
									value="Suite" onClick="roomSuite();"></td>
							</tr>
							<tr align="center">
								<td colspan="3"><input type="text" id = "roomType" name = "roomType" value = "" style="width: 45px;"> Room was chosen!</td>
							</tr>
							<tr align="center">
								<td colspan="3"><input type="button" name="prev"
									value="prev"> <input type="submit" name="next"
									value="next" onClick="checkField();"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>