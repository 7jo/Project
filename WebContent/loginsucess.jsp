<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ck_email =(String)request.getAttribute("email");
	String ck_pwd =(String) request.getAttribute("pwd");
	session.setAttribute("email", ck_email);
	session.setAttribute("pwd", ck_pwd);
	response.sendRedirect("/Tour/index.jsp");  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

</body>
</html>