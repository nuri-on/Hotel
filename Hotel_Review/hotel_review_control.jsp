<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hotel.revHotel.*,hotel.regHotel.*,java.util.ArrayList, java.util.Iterator, java.util.List"%>
<jsp:useBean id="ab" class="hotel.revHotel.ReviewBean" scope="page"/>
<jsp:useBean id="reviewBook" class="hotel.revHotel.ReviewBook" />
<jsp:setProperty name="reviewBook" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	int hotel_id = Integer.parseInt(session.getAttribute("hotel_id").toString());
	//session.setAttribute("user_id", 1);
	//session.setAttribute("hotel_id", 4);
	//int hotel_id = Integer.parseInt(session.getAttribute("hotel_id").toString());
	// session으로 받은 id값
	
	
	
	String action = request.getParameter("action");
	
	//if (action == null)
		//System.out.println("으아아");
		
	if (action.equals("list")) {
		ArrayList<ReviewBook> temp = ab.getDBListId(hotel_id);
		if (temp.size() == 0) {
			ReviewBook rb = new ReviewBook();
			rb.setGrade(0);
			rb.setHotel_id(hotel_id);
			rb.setReview_comment("등록된 리뷰가 없습니다");
			rb.setReview_id(0);
			rb.setUser_id(0);
			temp.add(rb);
			request.setAttribute("datas", temp);
			response.sendRedirect("hotel_review.jsp");
		}
		else {
			request.setAttribute("datas", temp);
			//pageContext.forward("hotel_review.jsp");
			response.sendRedirect("hotel_review.jsp");
		}
		
		
	} else if (action.equals("insert")) {
		if (ab.insertDB(reviewBook)) {
			System.out.println("리뷰 등록 성공!");
			response.sendRedirect("hotel_review_control.jsp?action=list");
		}
		else {
			System.out.println("리뷰 등록 실패!");
		}
	} else if (action.equals("edit")) {

	} else if (action.equals("update")) {

	} else if (action.equals("delete")) {

	} else {

	}
%>
<body>
</body>
</html>