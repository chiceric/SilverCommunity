<%@page import="silver.web.dao.LoginDAO"%>
<%@page import="silver.web.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달되는 파라미터(id,pwd) 받기
	String tel = request.getParameter("tel");
	String pwd = request.getParameter("pwd");
	
	//DAO를 통해서 login을 호출한다.
	//LoginVO vo = LoginDAO.login(tel, pwd);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(vo != null){
		//로그인 작업
		session.setAttribute("mem_vo", vo);
		out.println("로그인 완료!");
	}else{
		out.println("아이디 또는 비밀번호가 틀립니다.");
	}
%>
	<br/>
	<input type="button" value="초기화면"
	onclick="javascript:location.href='index.jsp'"/>
</body>
</html>


