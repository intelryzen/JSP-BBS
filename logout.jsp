<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<% session.invalidate(); %>
<script>
	location.href='index.jsp';
</script>
</body>
</html>