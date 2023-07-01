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
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('로그인이 필요합니다')");
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
      <li class="nav-item">
        <a class="nav-link" href="boardIndex.jsp">Q&amp;A게시판</a>
      </li>
		<p>
		</p>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          마이페이지
        </a>
        <div class="dropdown-menu" style="background-color: #343a40; border: none" aria-labelledby="navbarDropdownMenuLink">
          <a id="gray" class="dropdown-item active" style="color:white;" href="modifyinfo.jsp">내 정보수정</a>
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
	<% 
	String userId= (String)session.getAttribute("userId");
	userDao DAO = new userDao();
	userDto DTO = DAO.selectinfo(userId);
	request.setAttribute("DTO", DTO);
	%>
<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				 <form action="modifyResult.jsp" method="post">
					 <h3 style="text-align: center;">내 정보수정</h3>
						<div class="form-group">
						<h6>아이디: </h6><input type="text" class="form-control" name="id" value=${DTO.id} readonly>
						</div>
					    <div class="form-group">
						<h6>성명: </h6>
					 	<input type="text" class="form-control" name="name" value=${DTO.name} readonly>	
						</div>
        				<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" value="" name="pw" maxlength="20">	
						<input type="password" class="form-control" placeholder="비밀번호 확인" value="" name="pw2" maxlength="20">	
						</div>
					 	<div class="form-group">
					 	<h6>성별: </h6><input type="text" class="form-control" value=${DTO.gender} readonly>	
					    </div>
		<div class="form-group">
			 <h6>이메일: </h6><input type="email" class="form-control" value=${DTO.email} name="email" maxlength="50">
		</div>
			 <input type="submit" class="btn btn-primary form-control" value="정보수정">
				</form>
			</div>
		
	  </div>
	</div>
</body>
</html>