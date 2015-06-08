<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
	
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>

<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />

<script type="text/javascript">

	function clearTxt(txt) {
		if (txt.defaultValue == txt.value) {
			txt.value = "";
		}
	}
	
	function check() {
		//alert("User check !!");
		checkUser();
		//alert("......check !!");		
		return true;
	}
	
	function checkUser() {
		//alert(".../////check !!");	
		if (login_form.r[0].checked == true) {
			login_form.action.value = "login";
			//alert("User's login !!");
			
			return true;
			
		} else if (login_form.r[1].checked == true) {
			login_form.action.value = "Mlogin";
			//alert("Manager's login. !!");
			
			return true;
		}
		
		return false;
	}
	
</script>

</head>
<body>
	<center>
	<br> <br> <br> <br>
		<b><font size=30>LOGIN</font></b><br> <hr>  <br>

		<form name="login_form" action="login_control.jsp" method="post" onSubmit="return check();">
			<input type="hidden" name="action" value="login" >
			<input type="radio" name="r" value="1" checked>USER &nbsp;&nbsp; <input type="radio" name="r" value="2">MANAGER  <br> <br>
			
			<br> 
			<table>
				<tr>
					<!-- 이 메일 입력 -->
					<td width="200" align="center">E-MAIL</td>
					<td><input type="text" name="email" size="40"
						value="This field is required."
						onFocus="clearTxt(login_form.email)"></td>
				</tr>
				<tr>
					<!-- 패스워드 입력 -->
					<td align="center">PASSWORD</td>
					<td><input type="password" name="password" size="42"></td>
				</tr>
				<tr>
					<!-- 버튼 -->
					<td align="center" colspan="2"><br> <input type="submit" name="login_ok" value="Login">
						&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="join.jsp" target="_self">Sign up</a></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>