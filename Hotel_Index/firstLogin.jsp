<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
A:link {TEXT-DECORATION: none;
color: #FFFFFF;}
A:visited {TEXT-DECORATION: none;
color: #FFFFFF;}
A:hover {TEXT-DECORATION: underline ;
color:gray;}</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image:url('../Image/background.jpeg'); background-size: 1400px 661px; backgournd-repeat:no-repeat;">
<br>
<br>
<br>
<br>

<% int manager_id = Integer.parseInt(session.getAttribute("Manager_id").toString());
if (manager_id != 0)
	out.print("<center><font size=100 color=Black><span style='background-color:#000000; border:2px; font-size:100px'><u><a href='../Hotel_Registration/hotel_registration.jsp' target=_parent><b>REGISTRATE HOTEL</b></a></u></span></font></center>");%>

</body>
</html>