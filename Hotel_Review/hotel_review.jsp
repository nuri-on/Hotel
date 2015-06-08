<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hotel.revHotel.*,hotel.regHotel.*,java.util.ArrayList, java.util.Iterator, java.util.List"%>
<jsp:useBean id="ad" class="hotel.revHotel.ReviewBean" scope="page"/>
<jsp:useBean id="am" class="hotel.regHotel.HotelBean" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../termProject/HotelReservationStyle.css" type="text/css" media=all />
<title>Review</title>
</head>
<body>
<% 
int user_id = Integer.parseInt(session.getAttribute("User_id").toString());
int hotel_id = Integer.parseInt(session.getAttribute("hotel_id").toString());
int total = 0;
double average;

ArrayList<ReviewBook> datas = ad.getDBListId(hotel_id);


for (ReviewBook aa : (ArrayList<ReviewBook>)datas) {
	total += aa.getGrade();
}

average = total / (double)datas.size();

if (datas.size() == 0)
	average = 0;

//ReviewBook temp = (ReviewBook)datas.get(0);
//hotel_id = temp.getHotel_id();
System.out.println(hotel_id);
ArrayList<String> test = ad.getSNS(hotel_id);
//String facebook = ad.getSNS(hotel_id).get(0).toString();
//String twitter = ad.getSNS(hotel_id).get(1).toString();
String facebook = (String)test.get(0);
String twitter = (String)test.get(1);

HotelBook temp = am.getDB(hotel_id);
%>

<div align=center><br> <br>
		<b><font size=20>REVIEW</font></b><br> <hr><br>
		<table align=center>
<tr align=center><td><img src="<%=temp.getImage()%>" width=150></td><td width=300><img src="../Image/facebook.png"> <%=facebook %><br><img src="../Image/twitter.png"> <%=twitter %><br><br><font size=16 color=red>★</font> <%=average%></td>

</tr></table>
<br>
<hr>
<br>
<form name=form2 method=post action="hotel_review_control.jsp">

<input type=radio name=grade value=1>
★
<input type=radio name=grade value=2>
★★
<input type=radio name=grade value=3>
★★★
<input type=radio name=grade value=4>
★★★★
<input type=radio name=grade value=5>
★★★★★
<br>

<input type=hidden name=user_id value="1">
<input type=hidden name=hotel_id value="<%=hotel_id%>">
<textarea name="review_comment" cols=45 rows=10></textarea>
<input type=hidden name="action" value="insert">
<input type=submit name=submit value="등록">

</form>
<table border="1" width=900>
<tr align=center>
<th width=50>No</th>
<th width=150>Name</th>
<th width=600>Comment</th>
<th width=200>Grade</th>
</tr>
<% for (ReviewBook ab: (ArrayList<ReviewBook>)datas) { %>
<tr align=center>
<td><a href="javascript:check(<%=ab.getReview_id()%>)"><%=ab.getReview_id()%></a></td>
<% String name = ad.getUserName(ab.getUser_id()); %>
<td><%=name %></td>
<td><%=ab.getReview_comment() %></td>
<td><%switch (ab.getGrade()) {
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
	
}
%></td>
</tr>
<% } %>
</table>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>