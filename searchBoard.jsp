<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.util.Enumeration" %>
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
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
	if ((request.getParameter("condition_content")).equals("")){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('글자를 입력해주세요')");
		writer.println("history.back()");
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
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">번호</th>
				<th style="background-color: #eeeeee; text-align: center;">제목</th>
				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
			<!-- 예시본
				<td>1</td>
				<td>안녕하세요</td>
				<td>홍길동</td>
				<td>2017-05-03</td>
				</tr>
			-->
				
				<% 
				String condition = request.getParameter("condition");
				String c_content = request.getParameter("condition_content");
				if(condition.equals("title")){
				BBSDao dao = new BBSDao();
				ArrayList<BBS> list= dao.searchDefault(c_content);
				if(list.size()==0){
				%>
				
				<tr><td colspan=4>조건에 부합하는 결과가 없습니다.</td></tr>
				
				<% } else { %>
				<% for(int i=0; i<list.size(); i++){ %><tr>
				<td><%=list.get(i).getBbsId() %></td>
				<td><a href="selectBoard.jsp?bbsId=<%=list.get(i).getBbsId()%>"><%=list.get(i).getBbsTitle() %></a></td>
				<td><%=list.get(i).getUserId() %></td>
				<td><%=list.get(i).getBbsDate() %></td>
				</tr>
				<% 
				}
				}
				} else if(condition.equals("userId")){
				BBSDao dao = new BBSDao();
				ArrayList<BBS> list= dao.searchId(c_content);
				if(list.size()==0){
				%>
				
				<tr><td colspan=4>조건에 부합하는 결과가 없습니다.</td></tr>
				
				<% } else { %>
				<% for(int i=0; i<list.size(); i++){ %><tr>
				<td><%=list.get(i).getBbsId() %></td>
				<td><a href="selectBoard.jsp?bbsId=<%=list.get(i).getBbsId()%>"><%=list.get(i).getBbsTitle() %></a></td>
				<td><%=list.get(i).getUserId() %></td>
				<td><%=list.get(i).getBbsDate() %></td>
				</tr>
				<%  
				}
				}
				} else {
				
				BBSDao dao = new BBSDao();
				ArrayList<BBS> list= dao.searchContent(c_content);
				if(list.size()==0){
				%>
				
				<tr><td colspan=4>조건에 부합하는 결과가 없습니다.</td></tr>
				<% } else { %>
				<% for(int i=0; i<list.size(); i++){ %><tr>
				<td><%=list.get(i).getBbsId() %></td>
				<td><a href="selectBoard.jsp?bbsId=<%=list.get(i).getBbsId()%>"><%=list.get(i).getBbsTitle() %></a></td>
				<td><%=list.get(i).getUserId() %></td>
				<td><%=list.get(i).getBbsDate() %></td>
				</tr>
				<%  
				}
				}
				}
				%>
			</tbody>
		</table>
<div class="container">	
	<div class="row" style="display: inline-block">
<form action="searchBoard.jsp" method="post">
 	<div class="input-group mb-3">
	<select class="custom-select" name="condition" style="width:100px">
    <option selected value="title">제목</option>
  	<option value="content">내용</option>
 	<option value="userId">아이디</option>
	</select>
	<input type="text" class="form-control" placeholder="키워드를 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" name="condition_content" style="width:220px">
  	<div class="input-group-append">
    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
  	</div>
		</div>	
</form>
	</div>	
<div class="row" style="display: inline-block; float: right; matgin-top: 10px">
	<a class="btn btn-primary" style="color:white; float: right;" role="button" href="write.jsp">글쓰기</a>
</div>
		</div>	
		
	</div>
	</div>
	
</body>
</html>
	