<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="../termProject/HotelReservationStyle.css" type="text/css" media=all />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
<script>
function replace() {
	alert("Complete to registrate Hotel");
	$('#overview').val($('#overview').val().replace(/\n/g, '<br>'));
}

function upLoadImg(fileObj) {
	var filePath = fileObj.value;
	$('#imagePath').val(filePath);
	
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel Registration</title>
</head>
<body>
<div align="center">
<br> <br> <br> <br>
		<b><font size=30>REGISTRATION</font></b><br> <hr>  <br>
<form name=form1 method=post action="hotel_control.jsp">
<table border="1" width=600>
	<tr align=center>
		<th colspan=4>Basic Information<input name="manager_id" type=hidden value="<%=Integer.parseInt(session.getAttribute("Manager_id").toString())%>"></th> 
	</tr>
	<tr align=center>
		<td rowspan=3 colspan=2 width=150><input name="image" type=file id="imagePath" onchange="upLoadImg(this);"></td>
		<th>Name</th>
		<td><input name="name" type=text size=50></td>
	</tr>
	<tr align=center>
		<th>Location</th>
		<td><input name="location" type=text size=50></td>
	</tr>
	<tr align=center>
		<th>Overview</th>
		<td><textarea name="overview" cols=40 rows=10 id="overview"></textarea></td>
	</tr>
	<tr align=center>
		<th colspan=4>Room Information</th>
	</tr>
	<tr align=center>
		<th rowspan=2>Single</th>
		<th>Number</th>
		<td colspan=2><input name="room_single" type=text size=50></td>
	</tr>
	<tr align=center>
		<th>Cost</th>
		<td colspan=2><input name="room_single_cost" type=text size=50></td>
	</tr>
	<tr align=center>
		<th rowspan=2>Double</th>
		<th>Number</th>
		<td colspan=2><input name="room_double" type=text size=50></td>
	</tr>
	<tr align=center>
		<th>Cost</th>
		<td colspan=2><input name="room_double_cost" type=text size=50></td>
	</tr>
	<tr align=center>
		<th rowspan=2>Suite</th>
		<th>Number</th>
		<td colspan=2><input name="room_suite" type=text size=50></td>
	</tr>
	<tr align=center>
		<th>Cost</th>
		<td colspan=2><input name="room_suite_cost" type=text size=50></td>
	</tr>
	<tr align=center>
		<th colspan=4>SNS</th>
	</tr>
	<tr align=center>
		<th>Facebook</th>
		<td colspan=3><input name="facebook" type=text size=50></td>
	</tr>
	<tr align=center>
		<th>Twitter</th>
		<td colspan=3><input name="twitter" type=text size=50></td>
	</tr>
	<tr align=center>
		<td colspan=4><input name="reset" type=reset value="reset"> 
		<input name="submit" type=submit value="submit" onClick="replace()"> 
		<input type=hidden name="action" value="insert"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>