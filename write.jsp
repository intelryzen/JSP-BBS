<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType = "text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>


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
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>

		<% 
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
	%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="main.jsp">Navi Soft</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="main.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="boardIndex.jsp">Q&amp;A게시판</a>
      </li>
		<p>
		</p>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          마이페이지
        </a>
        <div class="dropdown-menu" style="background-color: #343a40; border: none" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" id="gray" style="color:white;" href="modifyinfo.jsp">내 정보수정</a>
		  <a class="dropdown-item" id="gray" style="color:white;" href="logout.jsp">로그아웃</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" style="float:right">
      <input class="form-control mr-sm-2" type="search" placeholder="키워드를 입력하세요.">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    </form>
  </div>
</nav>	

<div class="container" style="margin-top: 10px;">
	<div class="row">
		
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
    <li class="breadcrumb-item"><a href="boardIndex.jsp">Q&amp;A게시판</a></li>
    <li class="breadcrumb-item active" aria-current="page">글쓰기</li>
  </ol>
</nav>
		
		
			<div style="margin-top: 10px; width: 100%;">
				
		
			<form method="post" action="writeResult.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; cellspacing=0">
				
			<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
			</tr>
			<tr>
				<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"></textarea>
			</tr>
			</tbody>
					
		</table>
				
			<input type="submit" class="btn btn-primary" value="제출하기" style="float:right;">	
		
				</form>
			</div>
			

	</div>
	</div>
	
</body>
</html>