<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="project.*, java.util.*" %>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="UserInfo" class="project.UserInfo" />
<jsp:useBean id="UserInfoBean" class="project.UserInfoBean" />
<jsp:useBean id="ManagerBean" class="project.ManagerBean" />

<jsp:setProperty name="UserInfo" property="*" />

<%
	String action = request.getParameter("action");
	

	if (action.equals("login")) {
		UserInfo.setUser_id(UserInfoBean.getID(UserInfo.getEmail()));
		UserInfo info = UserInfoBean.getDB(UserInfo.getUser_id());
	    //System.out.println(UserInfo.getEmail());
	    //System.out.println(UserInfo.getPassword());
	    String dbPwd = info.getPassword();
	    String curPwd = UserInfo.getPassword();
	    
	   if( " ".equals(UserInfo.getEmail())) {
			out.println("<script>alert('Please enter a email.'); history.go(-1);</script> ");
			
		} else if (dbPwd.equals(curPwd)) {
			session.setAttribute("User_id", UserInfo.getUser_id());
			session.setAttribute("Manager_id", 0);
			session.setAttribute("loginstate", "ok");
			response.sendRedirect("index.jsp");
			//response.sendRedirect("../Hotel_Overview/overview.jsp");
			return;
				
		}else {
			out.println("<script>alert('The email or password you entered is incorrect.'); history.go(-1);</script>");
		}
	}
	
	else if (action.equals("Mlogin")) {
		UserInfo.setUser_id(ManagerBean.getID(UserInfo.getEmail()));
		UserInfo info = ManagerBean.getDB(UserInfo.getUser_id());
	    //System.out.println(UserInfo.getEmail()); //입력받은 이메일
	    //System.out.println(UserInfo.getPassword()); //입력받은 pw
	    //System.out.println(info.getEmail()); //입력한 이메일로 테이블에서 찾아온 id의 이메일
	    //System.out.println(info.getPassword()); //입력한 이메일로 테이블에서 찾아온 id의 pw
	    
		if( " ".equals(UserInfo.getEmail())) {
			out.println("<script>alert('Please enter a email.'); history.go(-1); </script> ");
	    
		} else if (info.getPassword().equals(UserInfo.getPassword())) {
			session.setAttribute("User_id", 0);
			session.setAttribute("Manager_id", UserInfo.getUser_id());
			session.setAttribute("loginstate", "ok");
			response.sendRedirect("index.jsp");
		} else {
			out.println("<script>alert('The email or password you entered is incorrect.'); history.go(-1);</script>");
		}
	}

	else if(action.equals("join")) {
		if (UserInfoBean.insertDB(UserInfo)) {
			response.sendRedirect("login.jsp");
		} else {
			
		}
	}
	
	
	else if(action.equals("Mjoin")) {
		if (ManagerBean.insertDB(UserInfo)) {
			response.sendRedirect("login.jsp");
		} else {
			
		}
	}


	else if(action.equals("mypage")) {
		Integer temp = (Integer)session.getAttribute("user_id");
		String temp2 = (String)session.getAttribute("loginstate");

		if (temp2.equals("ok") == true) {
			UserInfo Member = UserInfoBean.getDB(temp);
			request.setAttribute("member", Member);
			pageContext.forward("mypage.jsp");
		}
		else {
			out.println("<script>alert('You need to login!'); history.go(-1);</script>");
		}
	}
	
	
	else if(action.equals("logout")) {
		String temp = (String)session.getAttribute("loginstate");
		
		if (temp.equals("ok")) {
			out.println("<script>alert('LOGOUT');history.go(-1);</script>");
			session.setAttribute("loginstate", "no");
		}
		else {
			out.println("<script>alert('You need to login!');history.go(-1);</script>");
		}
	} 


%>

    