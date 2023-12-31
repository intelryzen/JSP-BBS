<%@ page language="java" contentType = "text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter" %> 
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
	if (session.getAttribute("userId")!=null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('이미 회원가입 하셨습니다.')");
		writer.println("location.href='main.jsp'");
		writer.println("</script>");
	}
	%>

 <nav class="navbar navbar-default">
  <div class="narbar-header">
  <button type="button" class="navbar-toggle collapsed"
   data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
   aria-expanded="false">
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
  </button>
  <a class="navbar-brand" href="main.jsp">JSP게시판 웹 사이트</a>
  </div>
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
     <li><a href="main.jsp" id="plus">메인</a></li>
     <li><a href="boardIndex.jsp" id="plus">게시판</a></li>
    </ul>
   <ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
     <a href="#" class="dropdown-toggle"
      data-toggle="dropdown" role="button" aria-haspopup="ture"
      aria-expanded="false">접속하기<span class="caret"></span></a>
		      <ul class="dropdown-menu">
              <li><a href="index.jsp">로그인</a></li>
              <li class="active"><a href="join.jsp">회원가입</a></li>
            </ul> 
    </li>
   </ul>
  </div>
 </nav>	
<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				 <form action="joinResult.jsp" method="post">
					 <h3 style="text-align: center;">회원가입</h3>
						<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">	
						</div>
					 <div class="form-group">
					 	<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">	
						</div>
        				<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20">	
						</div>
					    
					 	<div class="form-group" style="text-align:center;">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
  <label class="btn btn-secondary active">
    <input type="radio" name="gender" value="Man" id="option2" checked>남자
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="gender" value="Woman" id="option3">여자
  </label>
</div>				
					 </div>
		<div class="form-group">
			 <input type="email" class="form-control" placeholder="이메일" name="email" maxlength="50">
		</div>
			 <input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		
	  </div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
</body>
</html>