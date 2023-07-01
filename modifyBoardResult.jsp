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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/mine.css">
<title>Navi Soft</title>
</head>
<body>
	

	<% 
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
	int bbsId= Integer.parseInt(request.getParameter("bbsId"));
	String userId= (session.getAttribute("userId")).toString();
	BBSDao dao= new BBSDao();
	BBS dto= dao.selectBoard(bbsId);
	if (dto==null){ //사용자가 url을 입력해서 이미 삭제된 게시글을 들어갈려하는 경우
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	if(userId != null && userId.equals(dto.getUserId())){
		if(!(request.getParameter("bbsTitle")==null || request.getParameter("bbsContent") == null)){ 
		//사용자가 url이용해서 값할당없이 접속할경우 
	String bbsTitle = request.getParameter("bbsTitle")+""; //반환형이 String임 null값 대비하려고 초기화함 글쓰기에도 적용
	String bbsContent = request.getParameter("bbsContent")+"";
	int result = dao.modifyBoard(bbsId, bbsTitle, bbsContent);
		if(result==1){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('수정이 완료되었습니다.')");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
		} else {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('다시 시도해주세요')");		
		writer.println("history.back()");
		writer.println("</script>");
		}
	} else {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
} else { //사용자가 자기가 만든 글이 아닌 것을 삭제하려는 경우 -> 추방
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('권한이 없습니다.')"); 
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	%>
</body>
</html>