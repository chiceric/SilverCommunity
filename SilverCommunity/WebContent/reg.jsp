<%@page import="silver.web.dao.LoginDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%!
	// 배열을 받아 하나의 문자열로 
	// 변환하는 기능 선언
	public String makeString(
			String[] ar){
		StringBuffer buf = new StringBuffer();
		
		for(int i=0;i<ar.length; i++){
			// StringBuffer에 배열의 요소 중
			// 하나를 추가한다.
			buf.append(ar[i]);
		}
		return buf.toString();
	}
%> --%>
<%-- <%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	String s_name = request.getParameter("name");
	String s_pwd = request.getParameter("pwd");
	String s_gender = request.getParameter("gender");
	String s_birth = request.getParameter("birth");
	String s_nickname = request.getParameter("nickname");
	String[] s_phone = request.getParameterValues("phone");
	//배열을 저장할 수 없어서 하나의 문자열로
	//변환하는 메서드를 호출
	String s_tel = makeString(s_phone);
	
	String s_addr = request.getParameter("addr");
	
	
%>   --%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//추가할 정보들이 모두 준비되었으므로
//DAO를 이용하여 저장하자!
/* <%-- 	if(LoginDAO.add(s_tel, s_name, s_addr, s_birth, s_gender, s_pwd, s_nickname)){ */
%>
	<div>가입 완료!</div>	
<%-- <%		
	}else{
		out.println("가입실패!");
	}
%> --%> --%>
	<br/>
	<input type="button" value="초기화면"
	onclick="javascript:location.href='/index.sc'"/>	
</body>
</html>


