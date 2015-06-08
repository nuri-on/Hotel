<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, hotel.regHotel.*, hotel.revHotel.*, java.util.ArrayList"%>
<jsp:useBean id="ad" class="hotel.indHotel.IndexBean" scope="page"/>
<jsp:useBean id="ar" class="hotel.revHotel.ReviewBean" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style type="text/css">

* {
	background-color:black;
	color:white;
	/*font-family:Georgia;*/
}

th {
	background-color:white;
	color:black;
}

table {
	border:none;
}

td {
	font-size:25px;
}

a:link {
	text-decoration:none;
}

a:visited {
	text-decoration:none;
}

a:active {
	text-decoration:none;
}

a:hover {
	text-decoration:none;
}
</style>
</head>
<script>
function linkPage(p1) {
	
	var p4 = 'hotel_topmenu.html?hotel_id=';
	var p2 = 'menu.jsp?hotel_id=';
	var p3 = "../Hotel_Overview/overview.jsp?hotel_id=";
	p4 += p1;
	p2 += p1;
	p3 += p1;
	
	window.open(p4, "topmenu");
	window.open(p2,"menu");
	window.open(p3,"contents");
}

function noId() {
	alert("please Log-In");
}
</script>
<body>
<% 
String action = request.getParameter("action2");
String loc = request.getParameter("search");
out.print("<input type=hidden name=search value="+loc+">");
ArrayList<HotelBook> datas = null;

if (action.equals("list")) {
	datas = ad.getDBList(loc);
} else if (action.equals("highcost")) {
	datas = ad.getDBListHigh(loc);
}
else if (action.equals("lowcost")) {
	datas = ad.getDBListLow(loc);
}
else if (action.equals("grade")) {
	datas = ad.getDBListGrade(loc);
}
int i= 1;%>
<div align=right>
<a href="searchResult.jsp?action2=grade&search=<%=loc %>" target="contents">Alphabet</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="searchResult.jsp?action2=highcost&search=<%=loc %>" target="contents">Price Highest First</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="searchResult.jsp?action2=lowcost&search=<%=loc %>" target="contents">Price lowest First</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<br><br>
<table border="1" width=900 align=center>
<tr align=center>
<th>Thumbnail</th>
<th>Name</th>
<th>Location</th>
<th>Grade</th>
<th>Cost</th>
<th>Link</th>
</tr>
<% for (HotelBook ab: datas) { %>
<tr align=center>
<form><font size=18>
<td width=110><img src="<%=ab.getImage()%>" width=100></td>
<td><%=ab.getName() %></td>
<td><%=ab.getLocation() %></td>
<%int id = ab.getHotel_id(); 
ArrayList<ReviewBook> calg = ar.getDBListId(id);
int total = 0;
for (ReviewBook r : calg) {
	total += r.getGrade();
}
int average = (int)(total / (double)calg.size());
%>
<td><%  switch (average) {
case 1:
	out.print("★");
	break;
case 2:
	out.print("★★");
	break;
case 3:
	out.print("★★★");
	break;
case 4:
	out.print("★★★★");
	break;
case 5:
	out.print("★★★★★");
	break;
default:
	out.print("-");
	break;
	
}
%></td>
<td><%=ab.getRoom_single_cost() %>$ <b>PER 1DAY</b></td>
<input type=hidden name=hotel_id value="<%=id%>">
<td>
<% 
int user_id = Integer.parseInt(session.getAttribute("User_id").toString());
int manager_id = Integer.parseInt(session.getAttribute("Manager_id").toString());
if (user_id == 0 && manager_id == 0)
	out.print("<input type=button name=link value=Go onclick='noId();'>");
else
	out.print("<input type=button name=link value=Go onclick='linkPage("+id+");'>");
%>
</font>
</form></td>
</tr>
<% } %>
</table>
</body>
</html>