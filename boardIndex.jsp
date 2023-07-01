<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="OTHER.*" %> 
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
	if (session.getAttribute("userId")==null){
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");	
	}
		BBSDao dao = new BBSDao();
		time time = new time();
				//전체 페이지 수 결정 함수
				int totalBBS = dao.countBBS();
				int x = totalBBS/10;
				int x2 = totalBBS%10;
				int totalPage = 0;
				if(x2>0){
				totalPage = x + 1;
				} else {
				totalPage = x;
				}
	int next = 1;
	if(request.getParameter("next") == null){
	next = 1;
	} else {
	next = Integer.parseInt(request.getParameter("next"));
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
	
<div class="container" style="margin-top: 10px">
	<div class="row">
		
	<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Q&amp;A게시판</li>
    </ol>
	<button type="button" class="btn btn-primary">
    총 게시글 수&nbsp;<span class="badge badge-light"><%= totalBBS %></span>
</button>
    </nav>
		    <table class="table" style="text-align: center; margin-top:10px">
			<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
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
				if(totalPage == 0){
				%>
				<tr><td colspan ="5">게시글 목록이 없습니다.</td></tr>
				<% } else {
				ArrayList<BBS> list= dao.showBBS(next);	
				int count;
				%>
				<% 
				for(int i=0; i<list.size(); i++){
				count = dao.countComment(list.get(i).getBbsId());
				%>
				<tr>
				<th scope="row"><%=list.get(i).getBbsId() %></th>
				<td><a id="custom" style="display: inline;" href="selectBoard.jsp?bbsId=<%=list.get(i).getBbsId()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "&nbsp;") %><% if (count != 0){ %>&nbsp;[<%= count %>]<%}%></a>
				<% if(time.customNewTime(list.get(i).getBbsDate())){%><h6 style="display: inline;"><span class="badge badge-secondary" style="background-color: #FF8200;">New</span><%} else {%><%}%></h6></td>
				<td><%=list.get(i).getUserId() %></td>
				<td><%=time.customTime(list.get(i).getBbsDate())%></td>
				<td><%=list.get(i).getHits()%></td>
				</tr>
				<% 
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
	<a class="btn btn-primary" style="color:white; float: right;" role="button" href="write.jsp"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z"/>
  <path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 0 0 .5.5H4v.5a.5.5 0 0 0 .5.5H5v.5a.5.5 0 0 0 .5.5H6v-1.5a.5.5 0 0 0-.5-.5H5v-.5a.5.5 0 0 0-.5-.5H3z"/>
</svg> 글쓰기</a>
</div>
		</div>	
		<!-- 나중엔 html로 글자수를 제한하는 것외에 자바스크립트로 글자수를 제한하게 만들어야 함. 해커가 인위적으로 조작할 수있음 nbsp선언도 해야함-->
	</div>
	</div>
	
	 <!--페이지 뷰 기능-->
	<div style="padding-top: 10px;">

	<nav aria-label="Page navigation example">
     <ul class="pagination justify-content-center">
	 <%
	  int totalRs = totalPage/10;
	  int nextRs = next/10;
	  int totalRest = totalPage%10;    
      int nextRest = next%10;
	  if(next <=10){ 
	  %>
	  <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
      </li>
	  <%
	  } else if(11<= totalPage && next >= 11 && nextRest != 0){ //수정 필요 그냥 else로
	  %>
	  <li class="page-item">
      <a class="page-link" href="boardIndex.jsp?next=<%=nextRs*10%>" tabindex="-1" aria-disabled="true">이전</a>
      </li>
      <%
	  } else if(nextRest == 0 && next >= 11){
	  %>
	  <li class="page-item">
      <a class="page-link" href="boardIndex.jsp?next=<%=next-10%>" tabindex="-1" aria-disabled="true">이전</a>
      </li>  
		
		 
		 
		 
	  <%	  
	  }
	  ArrayList<BBS> list= dao.showBBS(next);	
	  if(list.size()==0){ //게시글이 아얘 없는지 체크
	  %>
	 <li class="page-item active"><a class="page-link" href="#">0</a></li>
	 <%
	 } else if(nextRest != 0 && nextRs == totalRs && totalRest != 0){
 	  for(int i = 1; i <= totalRest; i++){ 
	  %>
	 <li class="page-item<% if(next==nextRs*10+i){%> active<% } %>"><a class="page-link" href="boardIndex.jsp?next=<%=nextRs*10+i%>"><%= nextRs*10+i %></a></li>
	 <%
	 }
	 } else if ((nextRs == totalRs && totalRest == 0) || (nextRest == 0 && next <= totalPage)){
	 for(int i = 1; i <= 10; i++){ 
	 %> 
	 <li class="page-item<% if(next==nextRs*10-10+i){%> active<% } %>"><a class="page-link" href="boardIndex.jsp?next=<%=nextRs*10-10+i%>"><%= nextRs*10-10+i %></a></li>	 
		
	 <%
	 }
	 } 
	 else {
	 for(int i = 1; i <= 10; i++){
	 %>
	 <li class="page-item<% if(next==nextRs*10+i){%> active<% } %>"><a class="page-link" href="boardIndex.jsp?next=<%=nextRs*10+i%>"><%= nextRs*10+i %></a></li>
	 <%
	 }
	 }
	 %>
		 
		 
		 
		 
	 <%
	 if(totalPage <= 10 || (nextRs == totalRs && totalRest == 0) || (totalPage == next) || (nextRs == totalRs && nextRest >= 1) || (nextRest != 0 && nextRs*10+10 == totalPage)){
     %>
	 <li class="page-item page-item disabled">
      <a class="page-link" href="#">다음</a>
    </li>
  
	 <%
	 } else if(nextRest == 0 && next < totalPage){
     %>
	 <li class="page-item page-item">
      <a class="page-link" href="boardIndex.jsp?next=<%=next+1%>">다음</a>
     </li>
	 <%
	 } else { 
	 %> 
	 <li class="page-item page-item">
      <a class="page-link" href="boardIndex.jsp?next=<%=nextRs*10+11%>">다음</a>
     </li>
	 <%
	 } 
	 %> 
	</ul>
</nav>  
				
	</div>
</body>
</html>
	