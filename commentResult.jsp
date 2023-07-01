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
	String comment= request.getParameter("comment");
	String userId= (session.getAttribute("userId")).toString();
	if (request.getParameter("commentType") == null && request.getParameter("commentId") == null){ //오리지널 댓글 쓰는 경우
	BBSDao dao= new BBSDao();
	int result = dao.comment(bbsId, comment, userId);
	if (result == 1){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('댓글이 등록되었습니다.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");
	} else {
		PrintWriter writer = response.getWriter(); //사용자가 url을 입력해서 이미 삭제된 댓글을 들어갈려하는 경우 추가해야함.
		writer.println("<script>");
		writer.println("alert('오류가 발생했습니다.')");
		writer.println("history.back()");
		writer.println("</script>");
	}
	} else {
		int commentType=  Integer.parseInt(request.getParameter("commentType"));
		int commentId= Integer.parseInt(request.getParameter("commentId"));
		int modify = Integer.parseInt(request.getParameter("modify"));
		//대댓글이나 수정하는 경우
	    if (modify == 1){ //댓글 수정
			BBSDao dao= new BBSDao();
			int result = dao.modifyComment(bbsId, commentType, commentId, comment, userId);
			if (result == 0){
		PrintWriter writer = response.getWriter(); //오류
		writer.println("<script>");
		writer.println("alert('오류가 발생했습니다.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");	
			} else {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('댓글이 수정이 완료되었습니다.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");
		}
		} else if (modify == 0) { //대댓글
			BBSDao dao= new BBSDao(); //나중에 댓글이 중복되지않은지 등 검증 필요
			int result = dao.second_Comment(bbsId, commentType, comment, userId);
			if (result == 0){
		PrintWriter writer = response.getWriter(); //오류
		writer.println("<script>");
		writer.println("alert('오류가 발생했습니다.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");	
			} else {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('댓글이 등록되었습니다.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");
			}
		} else {
		PrintWriter writer = response.getWriter(); //오류
		writer.println("<script>");
		writer.println("alert('오류가 발생했습니다.')");
		writer.println("location.href='selectBoard.jsp?bbsId="+bbsId+"'");
		writer.println("</script>");
		}	
	}
	%>
	
	
</body>
</html>