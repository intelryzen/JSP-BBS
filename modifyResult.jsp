<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page language="java" contentType = "text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<% 
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('로그인이 필요합니다')");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
	String pw = request.getParameter("pw");
	String pw2 = request.getParameter("pw2");	
	if (pw == ""){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('비밀번호를 입력해주세요.')");
		writer.println("location.href='modifyinfo.jsp'");
		writer.println("</script>");
	}
	if (!pw.equals(pw2)){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('비밀번호가 서로 다릅니다.')");
		writer.println("location.href='modifyinfo.jsp'");
		writer.println("</script>");
	}
	
	userDao DAO = new userDao();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		userDto DTO = new userDto(id, pw, name, gender, email);
	int result = DAO.modifyinfo(DTO);
	if (result ==1){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('회원정보가 수정되었습니다.')");
		writer.println("history.back()");
		writer.println("</script>");
	}
	else{
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('다시 시도해주십시오.')");
		writer.println("history.back()");
		writer.println("</script>");
	}
	%>
</body>
</html>