<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String cPath = request.getParameter("cPath");
	String fname = request.getParameter("f_name");
	
	String path = application.getRealPath("/members/"+cPath+"/"+fname);
	
	File f = new File(path);
	
	f.delete();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="myDisk.jsp" method="post">		
		<input type="hidden" name="cPath" value="<%=cPath%>"/>
		<input type="submit" value="확인"/>
	</form>

</body>
</html>