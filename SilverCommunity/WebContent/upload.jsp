<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath = (String)session.getAttribute("cPath");
	
	//cPath가 기억하는 값은 "admin/test"형식이다.
	//절대경로로 변경해야 한다.
	String path = application.getRealPath("/members/"+cPath);

	//cos.jar에 있는 MultipartRequest객체 생성
	MultipartRequest mr = new MultipartRequest(request, path, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());	
	
	//파일 올리기(저장)
	File f = mr.getFile("file");
	
	//원래 파일명 얻기
	String o_name = mr.getOriginalFileName("file");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(f!=null)
	{
%>
		<%=f.getName()%>
<%
		if(!f.getName().equals(o_name))
		{
%>
			(<span style="color:blue; font-weight:bold">
				<%=o_name%>	
			</span>)
<%
		}
%>
		<!-- <script type="text/javascript">
				location.href="myDisk.jsp";
			 </script> -->
<%	
	out.println("파일이 저장되었습니다.");
	//response.sendRedirect("cPath");
%>
	
<%
	}
	else
	{
		out.println("파일 저장시 오류가 발생하였습니다.");
	}
%>

	<form action="myDisk.jsp" method="post">
		<input type="hidden" name="cPath" value="<%=cPath%>"/>
		<input type="submit" value="확인"/> 
	</form>
	
</body>
</html>