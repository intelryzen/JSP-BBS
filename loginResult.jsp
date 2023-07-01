<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
</head>
<body>
    <%
    //index에서 받은 로그인 파라미터를 받아 읽기
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
	String gender = request.getParameter("gender");
    String email = request.getParameter("email");

	userDao dao= new userDao();
	int result=dao.login(id, pw);
	PrintWriter writer = response.getWriter();
	if (result==1){
		session.setAttribute("userId", id);
		writer.println("<script>");
		writer.println("alert("+"'"+id+"님"+" 환영합니다."+"'"+")");
		writer.println("location.href='main.jsp'");
		writer.println("</script>");
	} else if (result==0){
		writer.println("<script>");
		writer.println("alert('비밀번호가 틀렸습니다.')");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	} else {
		writer.println("<script>");
		writer.println("alert('등록된 아이디가 없습니다.')");
		writer.println("location.href='index.jsp'");
		writer.println("</script>");
	}
	
	%>
        
</body>
</html>