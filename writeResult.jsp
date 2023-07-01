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
	if(!(request.getParameter("bbsTitle")==null || request.getParameter("bbsContent") == null)){ 
		BBSDao DAO = new BBSDao();
		String bbsTitle = request.getParameter("bbsTitle");
		String bbsContent = request.getParameter("bbsContent");
		String userId = (String)session.getAttribute("userId");
		int result = DAO.write(bbsTitle, bbsContent, userId);
		PrintWriter writer = response.getWriter();
	if (result ==1){
		writer.println("<script>");
		writer.println("alert('글 작성이 정상적으로 완료되었습니다.')");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	} else {
		writer.println("<script>");
		writer.println("alert('다시 시도해주십시오.')");
		writer.println("history.back()");
		writer.println("</script>");
	} 
	} else {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	%>
</body>
</html>