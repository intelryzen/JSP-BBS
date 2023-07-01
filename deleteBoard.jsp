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
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mine.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	

		<% 
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
		String userId= (session.getAttribute("userId")).toString();
		int bbsId= Integer.parseInt(request.getParameter("bbsId"));
		BBSDao dao = new BBSDao();
	    BBS dto= dao.selectBoard(bbsId);
	if (dto==null){ //사용자가 url을 입력해서 이미 삭제된 게시글을 들어갈려하는 경우(차후 위치조정 필요)
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	if(userId != null && userId.equals(dto.getUserId())){
			//사용자의 id와 게시글 작성id일치한지 검증
		int result = dao.deleteBoard(bbsId);
		if(result==1){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('삭제되었습니다.')");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
		} else {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('다시 시도해주세요')");		
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
		}
	} else { //사용자가 자기가 만든 글이 아닌 것을 삭제하려는 경우
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('다시시도해 주세요')"); 
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	%>
</body>
</html>