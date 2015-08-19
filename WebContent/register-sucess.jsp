<%@ page language="java" contentType="text/html; charset=UTF-8" import ="com.hanyang.tour.model.MemberDto"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email = (String)request.getAttribute("email");
String pwd = (String)request.getAttribute("pwd");
%>
<h2>가입 됬다.</h2>
<h3>니 정보 </h3>
Email <%=email %>
<br>
Pwd <%=pwd%>
<br>
<h4>맞냐?</h4>

<a href ="/Tour/page-login.jsp">로그인 페이지</a>

<a href ="/Tour/index.jsp">메인 페이지</a>

</body>
</html>