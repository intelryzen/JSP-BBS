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
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mine.css">
<title>JSP 게시판 웹 사이트</title>
	<script>
			function deleteConfirm(bbsId){
				var result= confirm("정말로 삭제하시겠습니까?");
				if(result){
				var link = "deleteBoard.jsp?bbsId="+bbsId;	
				location.href=link;
			} else {
				history.back();
			}
			}
/*
			function commentBtn(){
			var newNode = document.getElementById("copy");
			var cloneNode = newNode.cloneNode(true);
			var toNode = document.getElementById("commentWrite");
			body.appendChild("cloneNode");
						 }
*/
	</script>
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
	BBSDao dao= new BBSDao();
	BBS dto= dao.selectBoard(bbsId);
	if (dto==null){ //사용자가 url을 입력해서 이미 삭제된 게시글을 들어갈려하는 경우
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
<script src="js/bootstrap.js"></script>
	
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="main.jsp">Navi Soft</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="main.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="boardIndex.jsp">게시판</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          마이페이지
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">내 정보수정</a>
		  <a class="dropdown-item" href="#">로그아웃</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
</body>
</html>
	