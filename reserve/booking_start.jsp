<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Calendar"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking Start</title>
<script language="javascript">
function checkField() {
	if (document.getElementById("dateNum").value == "" ||
	document.getElementById("monthNum").value == "" ||
	document.getElementById("yearNum").value == "" ) {
		alert("시작 날짜를 선택하세요!");
		return false;
	}
}
</script>
<link rel="stylesheet" href="../termProject/HotelReservationStyle.css" type="text/css" />
</head>
<body>
	<center>
		<form name="formstart" method="post" action="toEnd.jsp">
			<table>
				<!-- 플로팅 프레임 -->
				<tr>
					<td>
						<!-- 예약 프레임 -->
						<table border="1">
							<tr align="center">
								<td>① Choose Room ▶ ② Payment ▶ ③ Payment Check</td>
							</tr>
							<tr align="center">
								<td><b><font color = "red" size=40>Choose Start Day</font></b></td>
							</tr>
							<tr align="center">
								<!-- 시작 날짜 달력 -->
								<td>
									<%
										// 스크립트잇 변수 선언
										String showDate = request.getParameter("showDate");
										Calendar cal = Calendar.getInstance();

										int nowYear = cal.get(Calendar.YEAR); // 오늘이 속한 년도
										int nowMonth = cal.get(Calendar.MONTH); // 오늘이 속한 달
										int nowDate = cal.get(Calendar.DATE); // 오늘의 날짜

										String sYear = request.getParameter("year");
										String sMonth = request.getParameter("month");
										int year = 0, month = 0; // 바꿀 날짜와 달

										if (sYear == null && sMonth == null) {
											year = cal.get(Calendar.YEAR); // 년도
											month = cal.get(Calendar.MONTH); // 월
										} else {
											year = Integer.parseInt(sYear);
											month = Integer.parseInt(sMonth);

											if (month < 0) // 1월달 이전으로 이동 불가
												month = 0;
											else if (month > 11) // 12월달 이후로 이동 불가
												month = 11;
										}
										cal.set(year, month, 1); // 기준 날짜 변경
										int day = cal.get(Calendar.DAY_OF_WEEK); // 요일
										int start = cal.getActualMinimum(Calendar.DATE); // 시작일 표시
										int end = cal.getActualMaximum(Calendar.DATE); // 끝날짜 표시
										int line = 0;
										String fontColor;
									%>
									<table border=0>
										<tr>
											<td align="left">
												<%
													out.print("<a href=\"booking_start.jsp?year=" + (year - 1));
													out.println("&month=" + month + "\">◀</a><b>&nbsp;&nbsp;" + year
															+ "년</b>");
													out.print("<a href=\"booking_start.jsp?year=" + (year + 1));
													out.println("&month=" + month + "\">▶</a>&nbsp;&nbsp;");
												%>
											</td>
											<td align="center">
												<%
													out.print("<a href=\"booking_start.jsp?year=" + year);
													out.println("&month=" + (month - 1) + "\">◀</a><b>&nbsp;&nbsp;"
															+ (month + 1) + "월</b>");
													out.print("<a href=\"booking_start.jsp?year=" + year);
													out.println("&month=" + (month + 1) + "\">▶</a>&nbsp;&nbsp;");
												%>
											</td>
											<td align="right"><b><%=nowYear + "-" + (nowMonth + 1) + "-" + nowDate%></b></td>
										</tr>
									</table>

									<table border=1>
										<tr align=center valign=middle>
											<td><font color="red">일</font></td>
											<td>월</td>
											<td>화</td>
											<td>수</td>
											<td>목</td>
											<td>금</td>
											<td>토</td>
										</tr>
										<%
											out.println("<tr height='50'>"); // 시작 날짜까지 빈칸 삽입
											for (int i = 1; i < day; i++) {
												out.println("<td>&nbsp;</td>");
												line++;
											}

											for (int i = start; i <= end; i++) { // 날짜 출력        
												fontColor = (line == 0) ? "red" : "black"; // 일요일 색깔 지정
										%>
										<td align="center"><input type='button'
											name="btnStart<%=i%>"
											style='background-color: black; height: 50px; width: 50px; font-size: 30; font-family: "Times New Roman"; color: white'
											value="<%=i%>" id="btnStart<%=i%>" onClick="getDate(<%=i%>);">
										</td>
										<%
											line++;

												if (line == 7 && i != end) { // 주별로 줄넘김
													out.println("</tr><tr height='50'>");
													line = 0;
												}
											}

											while (line > 0 && line < 7) { // 날짜 끝나고 난 뒤의 빈칸 채우기
												out.println("<td>&nbsp;</td>");
												line++;
											}
											out.println("</tr>");
										%>
									</table>
								</td>
							</tr>

							<tr align="center">
								<td><script language="javascript">	
						function getDate(i) {
							var year = <%=year%>;
							var month = <%=month + 1%>;
							alert("Your Choice is " + year + " / " + month + " / " + i + " !");	
							document.getElementById("dateNum").value = i;
							document.getElementById("monthNum").value = "<%=month + 1%>";
							document.getElementById("yearNum").value = "<%=year%>";
						}
						</script> Start Day : <input type="text" id="yearNum" name="yearNum"
									value="" style="width: 40px;" readonly> / <input type="text"
									id="monthNum" name="monthNum" value="" style="width: 20px;" readonly>
									/ <input type="text" id="dateNum" name="dateNum" value=""
									style="width: 20px;" readonly></td>
							</tr>
							<tr align="center">
								<td><input type="button" name="prev" value="prev">
									<input type="submit" name="next" value="next"></td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>