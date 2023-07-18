<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bWritePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		request.getParameter("writer");
		request.getParameter("subject");
		request.getParameter("email");
		request.getParameter("password");
		request.getParameter("content");
		
		
	%>

</body>
</html>