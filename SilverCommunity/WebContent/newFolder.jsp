<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	/* 파라미터 값 받기
	String cPath = request.getParameter("cPath");
	String fname = request.getParameter("f_name"); */
	
	String cPath = (String)session.getAttribute("cPath");
	String text = request.getParameter("text");
	
	String path = application.getRealPath("/members/"+cPath+"/"+text);

	//MultipartRequest mr = new MultipartRequest(request, path, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	File f = new File(path);
	
	if(!f.exists())
	{
		f.mkdirs();
	}
	
	response.sendRedirect("myDisk.jsp?cPath="+cPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
	if(f.isDirectory())
	{
		
		
	}
	else
	{
		out.println("같은 이름의 폴더가 존재합니다.");
%>
	<h1>폴더를 생성하였습니다.</h1>
<%
	}
%> --%>

	<form action="myDisk.jsp" method="post">
		<input type="hidden" name="cPath" value="<%=cPath%>"/>
		<input type="submit" value="확인"/> 
	</form>
</body>
</html>