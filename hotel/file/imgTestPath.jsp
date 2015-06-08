<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.io.File,java.io.IOException"%>

<%out.println(request.getParameter("filename"));%>
<br>
<br>
<img src="<%=request.getParameter("filename")%>" width="100">
