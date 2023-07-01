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
	String userId= (session.getAttribute("userId")).toString();
	BBSDao dao= new BBSDao();
	BBS dto= dao.selectBoard(bbsId);
	if (dto==null){ //사용자가 url을 입력해서 이미 삭제된 게시글을 들어갈려하는 경우
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='boardIndex.jsp'");
		writer.println("</script>");
	}
	if(!(userId != null && userId.equals(dto.getUserId()))){ //자기가 작성한 글 아니면 추방!
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('권한이 없습니다.')"); 
		writer.println("location.href='boardIndex.jsp'");
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
<div class="container">
	<div class="row">
		<form method="post" action="modifyBoardResult.jsp?bbsId=<%=bbsId%>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
			<tr>
				<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 양식</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td style="width: 20%">글 제목</td>
				<td>
<input type="text" class="form-control" value="<%= dto.getBbsTitle()%>" name="bbsTitle" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"><%= dto.getBbsContent()%>
				</textarea>
				</td>
			</tr>
				<!--textarea 는 value가 아닌 >< 괄호 사이에 넣어야 함>-->
			</tbody>
		</table>
	    <% 
		if(userId != null && userId.equals(dto.getUserId())){
		%>
		<a id="" href="selectBoard.jsp?bbsId=<%=bbsId%>" style="background:white; color:black;" class="btn btn-primary">뒤로가기</a>
		<input type="submit" class="btn btn-primary pull-right" value="작성완료">
		<input type="button" class="btn btn-primary pull-right" style="margin-right:5px" onClick="deleteConfirm(<%=bbsId%>)" value="삭제하기">
		<% 
		}
		%>
		</form>
	</div>
	</div>
	
</body>
</html>