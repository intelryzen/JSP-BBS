<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.5.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/mine.css">
<title>Navi Soft</title>
</head>
<body>
	<% 
	if (session.getAttribute("userId")==null){ //사용자 유효성 체크
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	} else{
	int bbsId= Integer.parseInt(request.getParameter("bbsId"));
	int commentId= Integer.parseInt(request.getParameter("commentId"));
	int commentType= Integer.parseInt(request.getParameter("commentType"));
	BBSDao dao= new BBSDao();
	int result = dao.deleteComment(bbsId, commentType, commentId);
	if (result==1){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");
	} else{
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('오류가 발생했습니다. 다시 시도해주세요.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");
	}
	}
	%>
	
	
	
	
	
	
	%>
	
	
</body>
</html>