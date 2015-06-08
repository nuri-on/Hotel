<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body style="background-image:url('../Image/background.jpeg'); background-size: 1400px 661px; backgournd-repeat:no-repeat;">
<%=request.getParameter("startDate") %>
<%=request.getParameter("endDate") %>
<% session.setAttribute("User_id", 0);
   session.setAttribute("Manager_id", 0);%>
</body>
</html>