<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Calendar"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking End</title>
<%
String sYear = request.getParameter("yearNum");
session.setAttribute("sYear", sYear);
String sMonth = request.getParameter("monthNum");
session.setAttribute("sMonth", sMonth);
String sDate = request.getParameter("dateNum");
session.setAttribute("sDate", sDate);

String startDay = sYear +  "-" + sMonth + "-" + sDate;
session.setAttribute("reservation_date", startDay);
%>
<script language="javascript">
function checkField() {
	if (document.getElementById("dateNum2").value == "" ||
	document.getElementById("monthNum2").value == "" ||
	document.getElementById("yearNum2").value == "" ) {
		alert("끝 날짜를 선택하세요!");
		 return false;
	}
}
</script>
<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />
</head>
<body>
	<center>
		<form name="form_end" method="post" action="toChooseRoom.jsp">
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
								<td><b><font color = "red" size=40>Choose End Day</font></b></td>
							</tr>
							<tr align="center">
								<!-- 시작 날짜 달력 -->
								<td>
									<%
										// 스크립트잇 변수 선언
										Calendar cal2 = Calendar.getInstance();

										int nowYear2 = cal2.get(Calendar.YEAR); // 오늘이 속한 년도
										int nowMonth2 = cal2.get(Calendar.MONTH); // 오늘이 속한 달
										int nowDate2 = cal2.get(Calendar.DATE); // 오늘의 날짜

										String sYear2 = request.getParameter("year2");
										String sMonth2 = request.getParameter("month2");
										int year2 = 0, month2 = 0; // 바꿀 날짜와 달

										if (sYear2 == null && sMonth2 == null) {
											year2 = cal2.get(Calendar.YEAR); // 년도
											month2 = cal2.get(Calendar.MONTH); // 월
										} else {
											year2 = Integer.parseInt(sYear2);
											month2 = Integer.parseInt(sMonth2);

											if (month2 < 0) // 1월달 이전으로 이동 불가
												month2 = 0;
											else if (month2 > 11) // 12월달 이후로 이동 불가
												month2 = 11;
										}
										cal2.set(year2, month2, 1); // 기준 날짜 변경
										int day2 = cal2.get(Calendar.DAY_OF_WEEK); // 요일
										int start2 = cal2.getActualMinimum(Calendar.DATE); // 시작일 표시
										int end2 = cal2.getActualMaximum(Calendar.DATE); // 끝날짜 표시
										int line2 = 0;

										String fontColor2;
									%>

									<table border=0>
										<tr>
											<td align="left">
												<%
													out.print("<a href=\"booking_end.jsp?year2=" + (year2 - 1));
													out.println("&month2=" + month2 + "\">◀</a><b>&nbsp;&nbsp;" + year2
															+ "년</b>");
													out.print("<a href=\"booking_end.jsp?year2=" + (year2 + 1));
													out.println("&month2=" + month2 + "\">▶</a>&nbsp;&nbsp;");
												%>
											</td>
											<td align="center">
												<%
													out.print("<a href=\"booking_end.jsp?year2=" + year2);
													out.println("&month2=" + (month2 - 1) + "\">◀</a><b>&nbsp;&nbsp;"
															+ (month2 + 1) + "월</b>");
													out.print("<a href=\"booking_end.jsp?year2=" + year2);
													out.println("&month2=" + (month2 + 1) + "\">▶</a>&nbsp;&nbsp;");
												%>
											</td>
											<td align="right"><b><%=nowYear2 + "-" + (nowMonth2 + 1) + "-" + nowDate2%></b></td>
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
											for (int i = 1; i < day2; i++) {
												out.println("<td>&nbsp;</td>");
												line2++;
											}

											for (int i = start2; i <= end2; i++) { // 날짜 출력        
												fontColor2 = (line2 == 0) ? "red" : "black"; // 일요일 색깔 지정
										%>
										<td align="center"><input type='button'
											name="btnStart<%=i%>"
											style='background-color: black; height: 50px; width: 50px; font-size: 30; font-family: "Times New Roman"; color: white'
											value="<%=i%>" id="btnStart<%=i%>" onClick="getDate(<%=i%>);">
										</td>
										<%
											line2++;

												if (line2 == 7 && i != end2) { // 주별로 줄넘김
													out.println("</tr><tr height='50'>");
													line2 = 0;
												}
											}

											while (line2 > 0 && line2 < 7) { // 날짜 끝나고 난 뒤의 빈칸 채우기
												out.println("<td>&nbsp;</td>");
												line2++;
											}
											out.println("</tr>");
										%>
									</table>
								</td>
							</tr>
							<tr align="center">
								<td>Start Day : <%=session.getAttribute("sYear")%> / 
								<%=session.getAttribute("sMonth")%> / <%=session.getAttribute("sDate")%></td>
							</tr>
							<tr align="center">
								<td>																	
								<script language="javascript">	
							function getDate(i) {
								var year = <%=year2%>;
								var month = <%=month2 + 1%>;
								alert("Your Choice is " + year + " / " + month + " / " + i + " !");	
								document.getElementById("dateNum2").value = i;
								document.getElementById("monthNum2").value = "<%=month2 + 1%>";
								document.getElementById("yearNum2").value = "<%=year2%>";
							}</script> End Day : <input type="text" id="yearNum2" name="yearNum2"
									value="" style="width: 40px;" readonly> / <input type="text"
									id="monthNum2" name="monthNum2" value="" style="width: 20px;" readonly>
									/ <input type="text" id="dateNum2" name="dateNum2" value=""
									style="width: 20px;" readonly></td>
							</tr>
							<tr align="center">
								<td><input type="button" name="prev" value="prev">
									<input type="submit" name="next" value="next" onClick = "checkField();"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>