<%@ page import="DAO.*" %> 
<%@ page import="DTO.*" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page language="java" contentType = "text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="u" class="DTO.userDto" scope="page"/>
<jsp:setProperty name="u" property="id"/>
<jsp:setProperty name="u" property="pw"/>
<jsp:setProperty name="u" property="name"/>
<jsp:setProperty name="u" property="gender"/>
<jsp:setProperty name="u" property="email"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
</head>
<body>
    <%
	PrintWriter writer = response.getWriter();
	if (u.getId()==null || u.getPw()==null || u.getName()==null || u.getGender()==null ||u.getEmail()==null){
		writer.println("<script>");
		writer.println("alert('입력이 안된 사항이 있습니다.')");
		writer.println("history.back()");
		writer.println("</script>");
	} else {
	userDao dao= new userDao();
		int result= dao.join(u);
	if (result==-1){
		writer.println("<script>");
		writer.println("alert('이미 존재하는 아이디 입니다.')");
		writer.println("history.back()");
		writer.println("</script>");
	} else {
		session.setAttribute("userId", u.getId());
		writer.println("<script>");
		writer.println("alert("+"'"+session.getAttribute("userId")+"님"+" 환영합니다."+"'"+")");
		writer.println("location.href='main.jsp'");
		writer.println("</script>");
	}
	}
    %>
    

</body>
</html>