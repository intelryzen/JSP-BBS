<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="OTHER.*" %>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %> 
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
	function scroll(){
	window.scrollTo(0, document.body.scrollHeight);
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
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>
	<% 
	if (session.getAttribute("userId")==null){ //사용자 유효성 체크
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
	int bbsId= Integer.parseInt(request.getParameter("bbsId"));
	BBSDao dao= new BBSDao();
	dao.upHits(bbsId);
	BBS dto= dao.selectBoard(bbsId);
	time time = new time();
	if (dto==null){ //사용자가 url을 입력해서 이미 삭제된 게시글을 들어갈려하는 경우
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
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
		<li class="nav-item">
        <a class="nav-link" href="boardIndex.jsp">공지사항&amp;이벤트</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="shop.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="white"><path fill-rule="evenodd" d="M20.322.75a10.75 10.75 0 00-7.373 2.926l-1.304 1.23A23.743 23.743 0 0010.103 6.5H5.066a1.75 1.75 0 00-1.5.85l-2.71 4.514a.75.75 0 00.49 1.12l4.571.963c.039.049.082.096.129.14L8.04 15.96l1.872 1.994c.044.047.091.09.14.129l.963 4.572a.75.75 0 001.12.488l4.514-2.709a1.75 1.75 0 00.85-1.5v-5.038a23.741 23.741 0 001.596-1.542l1.228-1.304a10.75 10.75 0 002.925-7.374V2.499A1.75 1.75 0 0021.498.75h-1.177zM16 15.112c-.333.248-.672.487-1.018.718l-3.393 2.262.678 3.223 3.612-2.167a.25.25 0 00.121-.214v-3.822zm-10.092-2.7L8.17 9.017c.23-.346.47-.685.717-1.017H5.066a.25.25 0 00-.214.121l-2.167 3.612 3.223.679zm8.07-7.644a9.25 9.25 0 016.344-2.518h1.177a.25.25 0 01.25.25v1.176a9.25 9.25 0 01-2.517 6.346l-1.228 1.303a22.248 22.248 0 01-3.854 3.257l-3.288 2.192-1.743-1.858a.764.764 0 00-.034-.034l-1.859-1.744 2.193-3.29a22.248 22.248 0 013.255-3.851l1.304-1.23zM17.5 8a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zm-11 13c.9-.9.9-2.6 0-3.5-.9-.9-2.6-.9-3.5 0-1.209 1.209-1.445 3.901-1.49 4.743a.232.232 0 00.247.247c.842-.045 3.534-.281 4.743-1.49z"></path></svg> 쇼핑몰</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="boardIndex.jsp">Q&amp;A게시판</a>
      </li>
		<p>
		</p>
		 <div class="topbar-divider d-none d-sm-block"></div>
		
      <li class="nav-item dropdown" style="display:inline; float: right;">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><svg width="1em" height="1em" fill="white" viewBox="0 0 16 16" class="bi bi-bell-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
</svg>
        </a>
        <div class="dropdown-menu" style="background-color: #343a40; border: none" aria-labelledby="navbarDropdownMenuLink">
		<a class="dropdown-item" id="gray" style="color:white;" href="cart.jsp"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-basket3-fill" fill="white" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.243 1.071a.5.5 0 0 1 .686.172l3 5a.5.5 0 0 1-.858.514l-3-5a.5.5 0 0 1 .172-.686zm-4.486 0a.5.5 0 0 0-.686.172l-3 5a.5.5 0 1 0 .858.514l3-5a.5.5 0 0 0-.172-.686z"/>
  <path d="M13.489 14.605A.5.5 0 0 1 13 15H3a.5.5 0 0 1-.489-.395L1.311 9H14.69l-1.201 5.605z"/>
  <rect width="16" height="2" y="6" rx=".5"/>
</svg> 장바구니</a>
        <a class="dropdown-item" id="gray" style="color:white;" href="modifyinfo.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="white"><path fill-rule="evenodd" d="M11.31 2.525a9.648 9.648 0 011.38 0c.055.004.135.05.162.16l.351 1.45c.153.628.626 1.08 1.173 1.278.205.074.405.157.6.249a1.832 1.832 0 001.733-.074l1.275-.776c.097-.06.186-.036.228 0 .348.302.674.628.976.976.036.042.06.13 0 .228l-.776 1.274a1.832 1.832 0 00-.074 1.734c.092.195.175.395.248.6.198.547.652 1.02 1.278 1.172l1.45.353c.111.026.157.106.161.161a9.653 9.653 0 010 1.38c-.004.055-.05.135-.16.162l-1.45.351a1.833 1.833 0 00-1.278 1.173 6.926 6.926 0 01-.25.6 1.832 1.832 0 00.075 1.733l.776 1.275c.06.097.036.186 0 .228a9.555 9.555 0 01-.976.976c-.042.036-.13.06-.228 0l-1.275-.776a1.832 1.832 0 00-1.733-.074 6.926 6.926 0 01-.6.248 1.833 1.833 0 00-1.172 1.278l-.353 1.45c-.026.111-.106.157-.161.161a9.653 9.653 0 01-1.38 0c-.055-.004-.135-.05-.162-.16l-.351-1.45a1.833 1.833 0 00-1.173-1.278 6.928 6.928 0 01-.6-.25 1.832 1.832 0 00-1.734.075l-1.274.776c-.097.06-.186.036-.228 0a9.56 9.56 0 01-.976-.976c-.036-.042-.06-.13 0-.228l.776-1.275a1.832 1.832 0 00.074-1.733 6.948 6.948 0 01-.249-.6 1.833 1.833 0 00-1.277-1.172l-1.45-.353c-.111-.026-.157-.106-.161-.161a9.648 9.648 0 010-1.38c.004-.055.05-.135.16-.162l1.45-.351a1.833 1.833 0 001.278-1.173 6.95 6.95 0 01.249-.6 1.832 1.832 0 00-.074-1.734l-.776-1.274c-.06-.097-.036-.186 0-.228.302-.348.628-.674.976-.976.042-.036.13-.06.228 0l1.274.776a1.832 1.832 0 001.734.074 6.95 6.95 0 01.6-.249 1.833 1.833 0 001.172-1.277l.353-1.45c.026-.111.106-.157.161-.161zM12 1c-.268 0-.534.01-.797.028-.763.055-1.345.617-1.512 1.304l-.352 1.45c-.02.078-.09.172-.225.22a8.45 8.45 0 00-.728.303c-.13.06-.246.044-.315.002l-1.274-.776c-.604-.368-1.412-.354-1.99.147-.403.348-.78.726-1.129 1.128-.5.579-.515 1.387-.147 1.99l.776 1.275c.042.069.059.185-.002.315a8.45 8.45 0 00-.302.728c-.05.135-.143.206-.221.225l-1.45.352c-.687.167-1.249.749-1.304 1.512a11.149 11.149 0 000 1.594c.055.763.617 1.345 1.304 1.512l1.45.352c.078.02.172.09.22.225.09.248.191.491.303.729.06.129.044.245.002.314l-.776 1.274c-.368.604-.354 1.412.147 1.99.348.403.726.78 1.128 1.129.579.5 1.387.515 1.99.147l1.275-.776c.069-.042.185-.059.315.002.237.112.48.213.728.302.135.05.206.143.225.221l.352 1.45c.167.687.749 1.249 1.512 1.303a11.125 11.125 0 001.594 0c.763-.054 1.345-.616 1.512-1.303l.352-1.45c.02-.078.09-.172.225-.22.248-.09.491-.191.729-.303.129-.06.245-.044.314-.002l1.274.776c.604.368 1.412.354 1.99-.147.403-.348.78-.726 1.129-1.128.5-.579.515-1.387.147-1.99l-.776-1.275c-.042-.069-.059-.185.002-.315.112-.237.213-.48.302-.728.05-.135.143-.206.221-.225l1.45-.352c.687-.167 1.249-.749 1.303-1.512a11.125 11.125 0 000-1.594c-.054-.763-.616-1.345-1.303-1.512l-1.45-.352c-.078-.02-.172-.09-.22-.225a8.469 8.469 0 00-.303-.728c-.06-.13-.044-.246-.002-.315l.776-1.274c.368-.604.354-1.412-.147-1.99-.348-.403-.726-.78-1.128-1.129-.579-.5-1.387-.515-1.99-.147l-1.275.776c-.069.042-.185.059-.315-.002a8.465 8.465 0 00-.728-.302c-.135-.05-.206-.143-.225-.221l-.352-1.45c-.167-.687-.749-1.249-1.512-1.304A11.149 11.149 0 0012 1zm2.5 11a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zm1.5 0a4 4 0 11-8 0 4 4 0 018 0z"></path></svg> 정보수정</a>
	     <a class="dropdown-item" id="gray" style="color:white;" href="logout.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="white"><path d="M9.036 7.976a.75.75 0 00-1.06 1.06L10.939 12l-2.963 2.963a.75.75 0 101.06 1.06L12 13.06l2.963 2.964a.75.75 0 001.061-1.06L13.061 12l2.963-2.964a.75.75 0 10-1.06-1.06L12 10.939 9.036 7.976z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg> 로그아웃</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" style="float:right">
      <input class="form-control mr-sm-2" type="search" placeholder="키워드를 입력하세요.">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    </form>
  </div>
</nav>	

	
<!--컨테이너-->
	
<div class="container" style="margin-top: 10px;">
<div class="row">
		
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="main.jsp">Home</a></li>
    <li class="breadcrumb-item"><a href="boardIndex.jsp">Q&amp;A게시판</a></li>
    <li class="breadcrumb-item active" aria-current="page"><%=bbsId %>번 게시글</li>
  </ol>
</nav>
		
			<table class="table table-bordered" style="text-align: center; vertical-align: middle; cellspacing=0">
			<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;"><%= dto.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "&nbsp;")%></th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td scope="row" style="text-align: left;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg> <%= dto.getUserId() %><span style="font-size: 10px;">&nbsp;&nbsp;&nbsp;<%=time.customTime(dto.getBbsDate())%>&nbsp;&nbsp;&nbsp;조회수&nbsp;&nbsp;<%=dto.getHits()%></span></td>
			</tr>	
			<tr>
				<td style="text-align: left; height: 200px;"><%= dto.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "</br>")%></td>
			</tr>
			</tbody>
		</table>
	</div>
		<div class="row" style="display: inline-block;">
		<a href="boardIndex.jsp" role="button" class="btn btn-light" style="border:1px solid #dee2e6"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-skip-start-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd" d="M4.5 3.5A.5.5 0 0 0 4 4v8a.5.5 0 0 0 1 0V4a.5.5 0 0 0-.5-.5z"/>
 				<path d="M4.903 8.697l6.364 3.692c.54.313 1.232-.066 1.232-.697V4.308c0-.63-.692-1.01-1.232-.696L4.903 7.304a.802.802 0 0 0 0 1.393z"/>
				</svg> 뒤로가기</a>
				</div>
		<% 
		String userId= (session.getAttribute("userId")).toString();
		if(userId != null && userId.equals(dto.getUserId())){
		%>
	
		<div class="row" style="float:right;">
			<a href="modifyBoard.jsp?bbsId=<%=bbsId%>" class="btn btn-primary" style="color: white;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-wrench" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M.102 2.223A3.004 3.004 0 0 0 3.78 5.897l6.341 6.252A3.003 3.003 0 0 0 13 16a3 3 0 1 0-.851-5.878L5.897 3.781A3.004 3.004 0 0 0 2.223.1l2.141 2.142L4 4l-1.757.364L.102 2.223zm13.37 9.019L13 11l-.471.242-.529.026-.287.445-.445.287-.026.529L11 13l.242.471.026.529.445.287.287.445.529.026L13 15l.471-.242.529-.026.287-.445.445-.287.026-.529L15 13l-.242-.471-.026-.529-.445-.287-.287-.445-.529-.026z"/>
		</svg> 수정</a>
		<!-- Button trigger modal -->
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" style="margin-left: 3px"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 		1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
  <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 	.708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
</svg> 삭제</button>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
    	<div class="modal-content">
     	 <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       정말로 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <a class="btn btn-danger" role="button" href="deleteBoard.jsp?bbsId=<%=bbsId%>" style="color: white">삭제</a>
      </div>
    </div>
  </div>
</div>
</div>	
	<% 
		}
	%>

</div>	
	
	
	<!--댓글보기 및 쓰기 구현-->	
<% 
	int count = dao.countComment(bbsId); //댓글 개수 구현
%>
<div class="container" style="padding-right: 0px; padding-left: 0px; margin-top: 15px;">
	<div style="width:100%;">
	<div class="accordion" id="accordionExample">
	<div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        댓글보기&nbsp;[<%= count %>]
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
    <div class="card-body">
		
		
	<!-- 일반댓글 뷰 기능-->
	<% 
	ArrayList<comment> list = dao.commentList(bbsId);
	for(int i = 0; i < list.size(); i++){
	if(list.size()!=0){ // *dao에 있는 isEmpty() 미활용
	if(list.get(i).getCommentId() == 1){
	%>
<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1; max-width: 700px; border-color:blue;">
  <div class="toast-header">
<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg>
	  
	<!--일반 댓글 삭제-->
    <!--<img src="..." class="rounded mr-2" alt="...">-->
    <strong class="mr-auto">&nbsp;&nbsp;<%= list.get(i).getUserId() %></strong>
    <small><%=time.customTime(list.get(i).getCommentDate())%></small>
	 <% if (userId.equals(list.get(i).getUserId())){ %>
	 <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" data-toggle="modal" data-target="#exampleModal<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>">
      <span aria-hidden="true">&times;</span>
    </button>

     <%
     }
     %>
  </div>

		
    <!--일반 댓글 뷰 기능, 수정, 대댓글 버튼(본인인증) 포함-->
<div class="toast-body" style="font-weight: 500;">
<%= list.get(i).getComment().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "</br>") %>
	  
<div class="row" style="float:right; position: relative; left: -4px;">
<% if (userId.equals(list.get(i).getUserId())){ %>
<a href="#" class="badge badge-light" data-toggle="collapse" data-target="#collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>1" aria-expanded="false" aria-controls="collapseExample1">수정</a>
<%	
}
%>
<a href="#" class="badge badge-light" data-toggle="collapse" data-target="#collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>" aria-expanded="false" aria-controls="collapseExample1">댓글쓰기</a>
</div>
</div>
</div>
		
	<!--일반댓글-대댓글 양식-->
	<form method="post" action="commentResult.jsp?bbsId=<%=bbsId%>&commentType=<%=list.get(i).getCommentType()%>&commentId=<%=list.get(i).getCommentId()%>&modify=0">
	<div class="collapse" id="collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>">
  	<div class="card card-body" style="padding-left:0px; padding-right: 0px; border: 0px; max-width: 700px;">
    <div class="form-group">
   	    <label for="exampleFormControlTextarea1"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg>&nbsp;&nbsp;<%=session.getAttribute("userId")%></label>
    	<textarea class="form-control" id="exampleFormControlTextarea1" placeholder="댓글을 작성해주세요." name="comment" maxlength="2048" rows="3"></textarea>
  		</div>
		<input type="submit" class="btn btn-primary" style="float: right; width: 100px;"  value="제출하기">
		</div>
  		</div>
		</form>
		
	<!--일반 댓글-수정 양식-->
		<form method="post" action="commentResult.jsp?bbsId=<%=bbsId%>&commentType=<%=list.get(i).getCommentType()%>&commentId=<%=list.get(i).getCommentId()%>&modify=1">
	<div class="collapse" id="collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>1">
  	<div class="card card-body" style="padding-left:0px; padding-right: 0px; border: 0px; max-width: 700px;">
    <div class="form-group">
   	    <label for="exampleFormControlTextarea1"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg>&nbsp;&nbsp;<%=session.getAttribute("userId")%></label>
    	<textarea class="form-control" id="exampleFormControlTextarea1" placeholder="댓글을 작성해주세요." name="comment" maxlength="2048" rows="3"><%= list.get(i).getComment().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;") %></textarea>
  		</div>
		<input type="submit" class="btn btn-primary" style="float: right; width: 100px;"  value="수정하기">
		</div>
  		</div>
		</form>
		
		<!-- 일반댓글 삭제 Modal -->
		<div class="modal fade" id="exampleModal<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>" aria-hidden="true">
  		<div class="modal-dialog">
    	<div class="modal-content">
     	 <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>">안내</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       정말로 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <a class="btn btn-danger" role="button" href="deleteComment.jsp?bbsId=<%=bbsId%>&commentId=<%=list.get(i).getCommentId()%>&commentType=<%=list.get(i).getCommentType()%>" style="color: white">삭제</a>
      </div>
    </div>
  </div>
</div> 	
		
<!--대댓글 기능-->
<% } else if(list.get(i).getCommentAvailable() == 1){ //그냥 한번 더 유효한지 인증
%>
<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1; max-width: 700px; position: relative; margin-left: 50px; border-color:skyblue;">
<div class="toast-header">
<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
  <path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/>
</svg><!--<img src="..." class="rounded mr-2" alt="...">-->
	
	<!--대댓글 삭제 버튼(본인인증 포함)-->
    
    <strong class="mr-auto">&nbsp;&nbsp;<%= list.get(i).getUserId() %></strong>
    <small><%=time.customTime(list.get(i).getCommentDate())%></small>
	  <% if (userId.equals(list.get(i).getUserId())){ %>
	  <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" data-toggle="modal" data-target="#exampleModal<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>">
      <span aria-hidden="true">&times;</span>
    </button>
	
    <% 
     }
    %>
 </div>

	
   <!--대댓글 뷰, 대댓글 수정, 답글 버튼-->
<div class="toast-body" style="font-weight: 500;">
<%= list.get(i).getComment().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "</br>") %>
<div class="row" style="float:right; position: relative; left: -4px;">
<% if (userId.equals(list.get(i).getUserId())){ %>
<a href="#" class="badge badge-light" data-toggle="collapse" data-target="#collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>1" aria-expanded="false" aria-controls="collapseExample1">수정</a>
<%	
}
%>
<a href="#" class="badge badge-light" data-toggle="collapse" data-target="#collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>" aria-expanded="false" aria-controls="collapseExample1">댓글쓰기</a>
</div>	
</div>
</div>
	
	<!--대댓글-댓글 양식-->
		<form method="post" action="commentResult.jsp?bbsId=<%=bbsId%>&commentType=<%=list.get(i).getCommentType()%>&commentId=<%=list.get(i).getCommentId()%>&modify=0">
	<div class="collapse" id="collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>">
  	<div class="card card-body" style="padding-left:0px; padding-right: 0px; border: 0px; max-width: 700px;">
    <div class="form-group">
   	    <label for="exampleFormControlTextarea1"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg>&nbsp;&nbsp;<%=session.getAttribute("userId")%></label>
    	<textarea class="form-control" id="exampleFormControlTextarea1" placeholder="댓글을 작성해주세요." name="comment" maxlength="2048" rows="3"></textarea>
  		</div>
		<input type="submit" class="btn btn-primary" style="float: right; width: 100px;"  value="제출하기">
		</div>
  		</div>
		</form>
		
	<!--대댓글-수정 양식-->	
		<form method="post" action="commentResult.jsp?bbsId=<%=bbsId%>&commentType=<%=list.get(i).getCommentType()%>&commentId=<%=list.get(i).getCommentId()%>&modify=1">
	<div class="collapse" id="collapseExample<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>1">
  	<div class="card card-body" style="padding-left:0px; padding-right: 0px; border: 0px; max-width: 700px;">
    <div class="form-group">
   	    <label for="exampleFormControlTextarea1"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg>&nbsp;&nbsp;<%=session.getAttribute("userId")%></label>
    	<textarea class="form-control" id="exampleFormControlTextarea1" placeholder="댓글을 작성해주세요." name="comment" maxlength="2048" rows="3"><%= list.get(i).getComment().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;") %></textarea>
  		</div>
		<input type="submit" class="btn btn-primary" style="float: right; width: 100px;"  value="수정하기">
		</div>
  		</div>
		</form>

		
		<!-- 대댓글 삭제 Modal -->
		<div class="modal fade" id="exampleModal<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>" aria-hidden="true">
  		<div class="modal-dialog">
    	<div class="modal-content">
     	 <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel<%=list.get(i).getCommentType()%><%=list.get(i).getCommentId()%>">안내</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       정말로 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <a class="btn btn-danger" role="button" href="deleteComment.jsp?bbsId=<%=bbsId%>&commentId=<%=list.get(i).getCommentId()%>&commentType=<%=list.get(i).getCommentType()%>" style="color: white">삭제</a>
      </div>
    </div>
  </div>
</div> 
<% 			}
		}
	}
%>
		</div>
      	</div>
   	 </div>
</div>
</div>
<!--댓글 작성 버튼 및 양식-->
<div class="container">
		<p></p>
		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onclick="scroll()" style="float:right;">
    	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
 	    <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg> 댓글작성
  		</button>
			<p></p>
	<form method="post" action="commentResult.jsp?bbsId=<%=bbsId%>">
	<div class="collapse" id="collapseExample">
  	<div class="card card-body" style="padding-left:0px; padding-right: 0px; border: 0px; max-width: 700px;">
    <div class="form-group">
   	    <label for="exampleFormControlTextarea1"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
</svg>&nbsp;&nbsp;<%=session.getAttribute("userId")%></label>
    	<textarea class="form-control" id="exampleFormControlTextarea1" placeholder="댓글을 작성해주세요." name="comment" maxlength="2048" rows="3"></textarea>
  		</div>
		<input type="submit" class="btn btn-primary" style="float: right; width: 100px;"  value="작성완료">
		</div>
  		</div>
		</form>
		</div>
	</div>  	
</body>
</html>