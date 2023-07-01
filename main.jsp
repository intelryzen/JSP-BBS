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
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery-3.5.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/mine.css">
<title>Navi Soft</title>
	<style>
	@media (max-width: 1500.98px) {
  .table {
    font-size: 5px;
  }
}
		
#circle1 {
background-color:#FF8224;
width:100px;
height:100px;
border-radius:75px;
text-align:center;
margin:0 auto;
font-size:12px;
vertical-align:middle;
line-height:150px;
}
	</style>
</head>
<body>
	<% 
	BBSDao dao = new BBSDao();
	time time = new time();
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
        <a class="nav-link active" href="main.jsp">Home<span class="sr-only">(current)</span></a>
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
		<div class="jumbotron">
 			 <h1 class="display-4">Navi Soft에 오신것을 환영합니다.</h1>
 			 <p class="lead">더 자세한 내용은 아래를 참고하세요.</p>
  			 <hr class="my-4">
 			 <p>이벤트가 진행중입니다. 아래 자세히 보기를 클릭하세요.</p>
  			<a href="#" class="btn btn-primary btn-lg" role="button" style="color:white;">자세히 보기</a>
		</div>
   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
 	  <ol class="carousel-indicators">
  	  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
	  <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
     </ol>
   <div class="carousel-inner">
      <div class="carousel-item active">
      <img src="image/01.jpg" class="d-block w-100" style="height: 400px" alt="...">
      </div>
      <div class="carousel-item">
      <img src="image/02.jpg" class="d-block w-100" style="height: 400px" alt="...">
      </div>
      <div class="carousel-item">
      <img src="image/03.jpg" class="d-block w-100" style="height: 400px" alt="...">
      </div>
	  <div class="carousel-item">
      <img src="image/04.jpg" class="d-block w-100" style="height: 400px" alt="...">
      </div>
	  <div class="carousel-item">
      <img src="image/05.jpg" class="d-block w-100" style="height: 400px" alt="...">
      </div>
  </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">이전</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">다음</span>
      </a>
  </div>
		
		
<div style="width: 33.3333%; margin-top: 10px;">
<div class="list-group list-group-horizontal" role="tablist" id="list-tab" style="width: 100%;">
	<a class="list-group-item list-group-item-action active" id="list-profile-list" data-toggle="list" aria-controls="home" role="tab" href="#list-home">공지사항</a> 
	<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" aria-controls="profile" role="tab" href="#list-profile">Q&amp;A게시판</a>
</div>
	  	  
<div class="tab-content" id="nav-tabContent" data-target="#list-example" data-offset="0" style="width: 100%; overflow:auto; padding-bot%tom: 15px;">
<div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list" style="min-width: 100%;">
	 <table class="table" style="text-align: center; width: 100%; table-layout:fixed;">
			<tbody style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
				<% 
				if(totalPage == 0){
				%>
				<tr><td>게시글 목록이 없습니다.</td></tr>
				<% } else {
				ArrayList<BBS> list= dao.showBBS(next);	
				%>
				<% 
				for(int i=0; i<5; i++){
				%>
				<tr>
				<th scope="row" style="width: 20%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><%=list.get(i).getBbsId() %></th>
				<td style="width: 80%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
				<a id="custom" style="display: inline;" href="selectBoard.jsp?bbsId=<%=list.get(i).getBbsId()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "&nbsp;") %></a>
					<% if(time.customNewTime(list.get(i).getBbsDate())){%><h6 style="display: inline;"><span class="badge badge-secondary" style="background-color: #FF8200;">New<%} else {%></span></h6><%}%></td>
				</tr>
				<% 
				}
				}
				%>
			   </tbody>
		       </table>
	</div>
<div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...2</div>
 </div>
	</div>		
</div>
<%
	if (session.getAttribute("userId")==null){ //사용자 유효성 체크
%>
	<div class="btn-group dropup">
  <button type="button" class="btn btn-primary" style="position: fixed; width: 4rem; height: 4rem; right: 25px; bottom: 25px; border-radius: 2rem; border:0;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <svg width="2.5em" height="2.5em" viewBox="1 0 16 16" class="bi bi-box-arrow-in-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.146 11.354a.5.5 0 0 1 0-.708L10.793 8 8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 1 8z"/>
  <path fill-rule="evenodd" d="M13.5 14.5A1.5 1.5 0 0 0 15 13V3a1.5 1.5 0 0 0-1.5-1.5h-8A1.5 1.5 0 0 0 4 3v1.5a.5.5 0 0 0 1 0V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v10a.5.5 0 0 1-.5.5h-8A.5.5 0 0 1 5 13v-1.5a.5.5 0 0 0-1 0V13a1.5 1.5 0 0 0 1.5 1.5h8z"/>
</svg>
  </button>
  <div class="dropdown-menu">
    <div class="card" style="width: 18rem;">
  <form class="px-4 py-3">
    <div class="form-group">
		<label for="exampleDropdownFormEmail1">아이디</label>
      <input type="text" class="form-control" id="exampleDropdownFormEmail1" placeholder="아이디">
    </div><!--원래 type은 email이었음..-->
    <div class="form-group">
      <label for="exampleDropdownFormPassword1">비밀번호</label>
      <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="비밀번호">
    </div>
    <div class="form-group">
      <div class="form-check">
        <input type="checkbox" class="form-check-input" id="dropdownCheck">
        <label class="form-check-label" for="dropdownCheck">
          로그인 상태 유지
        </label>
      </div>
    </div>
    <button type="submit" class="btn btn-primary">로그인</button>
  </form>
  <div class="dropdown-divider"></div>
  <a class="dropdown-item" href="#">처음이세요? 회원가입하러 가기</a>
  <a class="dropdown-item" href="#">아이디/비밀번호 찾기</a>
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
  </div>
</div>
<%
	}
%>		
	
	
</body>