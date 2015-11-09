
<%@page import="silver.web.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#wrap div{
		float: left;
	}
	#login,#g_form{
		width: 150px;
		height: 100px;
		text-align: right;
	}
	input{
		border: 1px solid black;
		background-color: #dedede;
	}
	.title{
		text-align: right;
	}
	div#reg{
		display: none;
	}
	
	input#id, input#pwd, input#repwd{
		width: 53px;
	}
	
	div#reg{
		position: absolute;
		top: 100px;
		left: 300px;
		width: 450px;
		height: 350px;
		background-color:#ffffff;
		border-radius: 10px;
		border: 1px solid black;
		padding: 10px;
		padding-top: 30px;
		text-align: left;
		display: none;
	}
</style>


<script type="text/javascript">
	
	
	//현재 페이지를 다른 logout페이지로 이동!
	function logout(){
		location.href="logout.jsp";
	}
	
	//회원 가입 폼을 보여주는 함수
	function regView(){
		//현재 문서에서 id가 "reg"인 요소를 검색한다.
		var reg_div = document.getElementById("reg");
		//검색된 요소를 화면에 보이도록 속성 변경
		reg_div.style.display = "block";
	}
	
	// 회원가입 폼에 값이 입력되었는지를 판단한 후
	// reg.jsp로 submit하는 함수
	function open(){
		
	}
	
	function reg(){
		//현재 문서의 두번째 폼요소내에 있는 입력요소들을 모두
		//입력값을 확인하기 위한 반복문
		var pwd = document.forms[1].pwd.value;
		var repwd = document.forms[1].repwd.value;
		
		if(pwd != repwd)
			{
				alert("비밀번호가 다릅니다.");
				document.forms[1].pwd.value="";
				document.forms[1].repwd.value="";
				document.forms[1].pwd.focus();
				return;	
			}
		
		for(var i=0; i<document.forms[1].elements.length; i++){
			if(document.forms[1].elements[i].value == ""){
				//폼의 자식요소들 중 특정 요소의 값이 비어있다면...
				alert(document.forms[1].elements[i].name+"을(를) 입력하세요!");
				
				//해당 요소로 커서 이동
				document.forms[1].elements[i].focus();
				return;
			}
		}
		
		//if문 안에 있는 return문을 만나지 않았을 경우!
		document.forms[1].submit();
	}
	
	function myDisk(){
		location.href="myDisk.jsp";
	}
	
	function login(){
//		var s_id = document.getElementById("m_id").value;
		var s_id = document.forms[0].id.value;
		var s_pwd = document.forms[0].pwd.value;
		
		if(s_id == ""){
			alert("아이디를 입력하세요");
			document.forms[0].id.focus();
			return;
		}
		if(s_pwd == ""){
			alert("비밀번호를 입.력하세요");
			document.forms[0].pwd.focus();
			return;
		}
		document.forms[0].submit();
	}
</script>


</head>
<body>
	<div id="wrap">
<% 
	//세션에 저장된 값들 중 이름이
	//mem_vo라는 이름으로 저장된 객체 가져오기
	Object obj = session.getAttribute("mem_vo");

	if(obj == null){
%>
		<div id="login">
			<div id="l_form">
				<form action="login.jsp" method="post">
					<fieldset>
						<legend><img src="img/login.png"/></legend>
						<label for="m_id">TEL:</label>
						<input type="text" name="tel" id="tel" size="8" maxlength="14"/><br/>
						<label for="m_pwd">PW:</label>
						<input type="password" name="pwd" id="pwd" size="8"/><br/>
						
						<input type="button" value="Registry" onclick="regView()"/>
						
						<input type="button" value="Login" id="log_bt" onclick="login()"/>
					</fieldset>
				</form>
			</div>
		</div>
<%
	}else{
		//세션에 mem_vo라는 이름으로 
		//저장된 객체가 있는 경우다.
		//이때
		// 그것을 MemberVO로 변환한다.
		LoginVO vo = (LoginVO)obj;
%>
		<div id="g_form">
			<span class="u_name"><%=vo.getName() %>  </span>
			(<span class="u_id"><%=vo.getTel() %>  </span>)님 환영합니다.
			<p>
				<input type="button" value="Logout"
					onclick="logout()"/>
			</p>
			<p>
				<input type="button" value="My Disk"
					onclick="myDisk()"/>
			</p>
		</div>
<% 
	}//if문의 끝!
%>
			<div id="reg">
				<form action="reg.jsp" method="post">
					<fieldset>
						<legend><img src="img/reg.png"/></legend>
						<table cellpadding="4" cellspacing="0">
							<tfoot>
								<tr>
									<td colspan="2" align="right">
										<input type="button" value="Registry"
											onclick="reg()"/>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td class="title"><label for="name"><img src="img/name.png"></label></td>
									<td><input type="text" name="name" id="name" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="id"><img src="img/gender.png"></label></td>
										<td><select name="gender">
											<option value="male">남</option>
											<option value="female">여</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="title"><label for="birth"><img src="img/birth.png"></label></td>
									<td><input type="text" name="birth" id="birth" size="8"/></td>
								</tr>
								<tr>
									<td class="title"><label for="phone"><img src="img/phone.png"></label></td>
									<td><select name="phone">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>-<input type="text" name="phone" id="phone" size="4"/>
									-<input type="text" name="phone" id="phone" size="4"/></td>
									<td>
									<img name="check" onclick="open()" src="img/check.png">
									</td>									
								</tr>
								<tr>
									<td class="title"><label for="pwd"><img src="img/pwd.png"></label></td>
									<td><input type="password" name="pwd" id="pwd" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="repwd"><img src="img/pwd.png"></label></td>
									<td><input type="password" name="repwd" id="repwd" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="nickname"><img src="img/nickname.png"></label></td>
									<td><input type="text" name="nickname" id="nickname" size="30"/></td>
								</tr>
								<tr>
									<td class="title"><label for="addr"><img src="img/addr.png"></label></td>
									<td><input type="text" name="addr" id="addr" size="30"/></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
			</div>
		
	</div>
</body>
</html>










    