<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
	int checkSqlResult =(int)request.getAttribute("check");
    String act = (String)request.getAttribute("act");
    if(act.equals("del")){
    	response.sendRedirect("/Tour/notice");
    }else{
    	  String contents = (String)request.getAttribute("contents");
    	  if(contents.equals("")){
%>
	<script type="text/javascript">
		alert("빈칸은 공지할 수 없습니다.");
	</script>
	<%
			if(request.getAttribute("id")!=null){
				String id = (String)request.getAttribute("id");
				response.sendRedirect("/Tour/page-notice-act.jsp?id="+id+"&act="+act);
			}else{
				response.sendRedirect("/Tour/page-notice-act.jsp"+"?act="+act);
			}
	    }else{
		    if(checkSqlResult != 0){
		    	response.sendRedirect("/Tour/notice");
				}
		    else{
    	%>
	<script type="text/javascript">
		alert("데이터베이스에 오류가 있습니다.");
	</script>
	<%
		    }
	    }
	}
    
%>
</body>
</html>