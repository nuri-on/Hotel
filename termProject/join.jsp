<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" 
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>

<link rel="stylesheet" href="HotelReservationStyle.css" type="text/css" media=all />

<script type="text/javascript" >
	var check1 = false;

	function checkUser() {
		if (join_form.r[0].checked == true) {
			join_form.action.value = "join";
			alert("Thank you. User's account has been created!!");
			
			return true;
			
		} else if (join_form.r[1].checked == true) {
			join_form.action.value = "Mjoin";
			alert("Thank you. Manager's account has been created!!");
			
			return true;
		}
		
		return false;
	}

	function checkEmail(){
		if((join_form.email.value.indexOf("@") == -1) || (join_form.email.value.indexOf(".") == -1)){
			
			alert("'@', '.' Including the full email address");
			join_form.email.focus();
			join_form.email.value="";
			
			return false;
			
		} else {
			check1 = true;
			alert("available email address.");			
		}
	}
				
	function  checkOthers(){
		var textPw1 = join_form.password.value;
		var textPw2 = join_form.password2.value;
		
		var textT3 = join_form.phone1.value;
		var textT4 = join_form.phone2.value;
		var textT5 = join_form.phone3.value;
		
		if (textPw1 == ""){
			alert("Password field is required.");
			join_form.password.focus();

			return false;
			
		} else if (check1 == false){
			alert("Please please click a 'check' button to check your email.");
			join_form.email.focus();

			return false;
			
		} else if(textPw1.length < 8){
			alert("Short passwords are easy to guess. Try a more than 8 characters.");
			join_form.password.focus();

			return false;
	
		} else if(textPw1 != textPw2){
			alert("Passwords do not match. Do you want to try again?");
			join_form.password2.focus();

			return false;
				
		} else if (isNaN(textT3) || isNaN(textT4) || isNaN(textT5)){
			alert("The Mobile number is invalid. Make sure to enter numbers.");

			join_form.phone1.value = "";
			join_form.phone2.value = "";
			join_form.phone3.focus();

			return false;
			
		} else if (textT3 == "" || textT4 == "" || textT5 == ""){
			alert("Mobile field is required.");
			join_form.phone2.focus();

			return false;
			
		} else if(join_form.agree.checked == false){
			alert("check your agreement");

			return false;
										
		} else {
			alert("submit completely");
			checkUser();
			
			return true;
		}
		
		return false;
	}
	
	
</script>
</head>

<body>
<center>
<br> <br> <br> <br>
		<b><font size=30>JOIN</font></b><br> <hr>  <br>

<form name="join_form" action="login_control.jsp" method="post" onSubmit="return checkOthers();">
<input type='hidden' name='action' value='join'>

<input type="radio" name="r" value="1" checked>USER &nbsp;&nbsp; <input type="radio" name="r" value="2">MANAGER  <br> <br>
<br>
	<table>
		<tr> <!-- 이름 입력 -->
			<td width="200" align="center">USER NAME</td>
			<td><input type="text" name="name" size="40"></td>
		</tr>
		<tr> <!-- 이 메일 입력 -->
			<td align="center">E-MAIL</td>
			<td><input type="text" name="email" size="40">&nbsp;<input type="button" name="check" value="check" onClick="checkEmail();"></td>
		</tr>
		<tr> <!-- 패스워드 입력 -->
			<td align="center">Create a Password</td>
			<td><input type="password" name="password" size="42" ></td>
		</tr>
		<tr> <!-- 패스워드 확인 -->
			<td align="center">Confirm a Password</td>
			<td><input type="password" name="password2" size="42" ></td>
		</tr>
		<tr> <!-- 폰번호 입력 -->
		  	<td align="center">MOBILE</td>
			<td>
				<input type="text" name="phone1" size="2" maxlength="3" value="010"> -
				<input type="text" name="phone2" size="2" maxlength="4"> - 
		        <input type="text" name="phone3" size="2" maxlength="4">
			</td>
		</tr>
		<tr>
			<td colspan="2"><br><br><input type="checkbox" name="agree"/> Terms of Service and Privacy Policy,and intended use personal information<br>collected items Retention agree.</td>
		</tr>
		<tr> <!-- 회원 가입 완료 버튼 -->
			<td colspan="2" align="right"><br><input type="submit" name="submit_ok" value="confirm"></td>
		</tr>
	</table>
</form>
</center>
</body>
</html>