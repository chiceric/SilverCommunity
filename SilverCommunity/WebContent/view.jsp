<%@page import="silver.web.vo.LoginVO"%>
<%-- <%@page import="java.util.List"%>
<%@page import="mybatis.vo.CommVO"%>
<%@page import="java.io.File"%>
<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="mybatis.vo.BbsVO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	/* request.setCharacterEncoding("utf-8");

	String b_idx = request.getParameter("b_idx");
	String nowPage = request.getParameter("cPage");
	
	if(nowPage == null)
	{
		nowPage = "1";
	}
	
	BbsVO vo = BbsDAO.view(b_idx);
	
	BbsVO vo = request.getAttribute("view");
	
	if(vo == null)
	{
		response.sendRedirect("list.jsp?cPage="+nowPage);
	}
	else
	{
		*/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	div{
		width: 600px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	div#del_win{
		position: absolute;
		top: 100px;
		left: 300px;
		width: 350px;
		height: 100px;
		background-color:#ffffff;
		border-radius: 10px;
		border: 1px solid black;
		padding: 10px;
		padding-top: 30px;
		text-align: center;
		display: none;
	}
	div#cDel_win{
		position: absolute;
		top: 100px;
		left: 300px;
		width: 350px;
		height: 100px;
		background-color:#ffffff;
		border-radius: 10px;
		border: 1px solid black;
		padding: 10px;
		padding-top: 30px;
		text-align: center;
		display: none;
	}
	
		
</style>

<script type="text/javascript">
	function show(){
		// 아이디가 "file_win"인 객체를 검색한다.
		var del_div = document.getElementById("del_win");
		
		del_div.style.display = "block";
	}
	
	function cShow(){
		
		var cDel_div = document.getElementById("cDel_win");
		
		cDel_div.style.display = "block";
	
	}
	
	function del_bbs(){
		
		var pw = document.getElementById("pwd").value;
		
		if(pw == "")
		{
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		document.myForm.pwd.value = pw;
		document.myForm.action = "con?type=del";
		document.myForm.submit();
	}
	
	/* function cDel_bbs(){
				
		var pw = document.getElementById("cPwd").value;
		
		if(pw == "")
		{
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		document.cForm.pwd.value = pw;
		document.cForm.action = "con?type=cDel";
		document.cForm.submit();
	} */
	
	function noView_del(){
		var del_div = document.getElementById("del_win");
		
		del_div.style.display = "none";
	}
	
	function nocView_del(){
		var cDel_div = document.getElementById("cDel_win");
		
		cDel_div.style.display = "none";
	}	
	
	function edit(){
		
		document.myForm.action = "edit.jsp";
		document.myForm.submit();
	}
	
	function editComm(){
		
		document.cForm.action = "editComm.jsp";
		document.cForm.submit();		
	}
	
	function delComm(){
		
		document.cForm.action = "delComm.jsp";
		document.cForm.submit();
		
	}
</script>
</head>
<body>
	<%-- <div id="bbs">
	<form method="post" >
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
			<%
				LoginVO vo = (LoginVO)request.getAttribute("view");
				String nowPage = (String)request.getAttribute("page");
			%>
				<tr>
					<th>제목:</th>
					<td><%=vo.getSubject()%></td>
				</tr>

				<tr>
					<th>첨부파일:</th>
					<td><a href="con?type=down&file_name=<%=vo.getFile_name()%>">
						<%=vo.getFile_name()%>
					</a></td>
				</tr>
				
				<tr>
					<th>이름:</th>
					<td><%=vo.getWriter()%></td>
				</tr>
				<tr>
					<th>내용:</th>
					<%if(vo.getContent() != null){%>
					<td><%=vo.getContent().trim().replaceAll("\n", "<br/>")%></td>
					<%}else{
					%>
					<td>입력된 내용이 없습니다.</td>	
					<%}%>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="javascript:location.href='con?type=edit&b_idx=<%=vo.getB_idx()%>&cPage=<%=nowPage%>'"/>
						<input type="button" value="삭제" onclick="javascript:location.href='delete.jsp?b_idx=<%=vo.getB_idx()%>&file_name=<%=vo.getFile_name()%>&cPage=<%=nowPage%>'"/>
						<input type="button" value="삭제" onclick="javascript:show()">
						<input type="button" value="목록" onclick="javascript:location.href='con?type=list&cPage=<%=nowPage%>'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="con?type=cWrite">
		이름:<input type="text" name="writer"/><br/>
		내용:<textarea rows="4" cols="55" name="content"></textarea><br/>
		비밀번호:<input type="password" name="pwd"/><br/>
		
		
		<input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>">
		<input type="hidden" name="cPage" value="<%=nowPage%>"/>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"/> 
		<input type="submit" value="저장하기"/> 
	</form>
	
	댓글들<hr/>
	
	<%
	List<CommVO> list = vo.getC_list();
	for(int i=0; i<list.size(); i++){ %>
	
		<div>
			이름:<%=list.get(i).getWriter()%> &nbsp;&nbsp;
			날짜:<%=list.get(i).getWrite_date()%><br/>
			내용:<%=list.get(i).getContent()%>
			<div align="right">
				<input type="button" value="수정" onclick="javascript:location.href='con?type=cView&c_idx=<%=list.get(i).getC_idx()%>&b_idx=<%=vo.getB_idx()%>&cPage=<%=nowPage%>'"/>
				<input type="button" value="삭제" onclick="javascript:location.href='cDel?c_idx=<%=list.get(i).getC_idx()%>&b_idx=<%=vo.getB_idx()%>&cPage=<%=nowPage%>'"/>
				<input type="button" value="삭제" onclick="javascript:cShow()">
			</div>
		</div>
		<form name="cForm" method="post">
			<input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>"/>
			<input type="hidden" name="cPage" value="<%=nowPage%>"/>
			<input type="hidden" name="c_idx" value="<%=list.get(i).getC_idx()%>"/>
			<input type="hidden" name="pwd"/>
		</form>
		
			<div id="cDel_win">
				<form action="con?type=cDel&c_idx=<%=list.get(i).getC_idx()%>" method="post">
					비밀번호:<input type="password" name="pwd"/><br/><br/>
					<input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>"/>
					<input type="hidden" name="cPage" value="<%=nowPage%>"/>
					<input type="submit" value="확인"/>
					<input type="button" value="취소" onclick="nocView_del()"/>
				</form>
			</div>
	<%}%>
	</div>
	
	<div id="del_win">
			비밀번호:<input type="password" id="pwd"/><br/><br/>
			<input type="button" value="확인" onclick="del_bbs()"/>
			<input type="button" value="취소" onclick="noView_del()"/>
	</div>
	
	<form name="myForm" method="post">
		<input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>"/>
		<input type="hidden" name="cPage" value="<%=nowPage%>"/>
		<input type="hidden" name="pwd"/>
	</form> --%>
</body>
</html>

	