<%@page import="silver.web.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<title>fixed</title>
			<link rel="stylesheet" href="c:/web/css/reset.css" />
			<style>
				p{width:200px; font:1.5em dotum; color:gray;}
				p img{display:block;}
				ul{width:150px; margin:10px 0;}
				ul li a{display:block; background:#123456; margin:2px 0; padding:5px; color:#fff; font:bold 1em arial;
						text-decoration:none;}
				ul li a:hover{background:#456789; text-decoration:underline; color:red;}

				#container{width:auto; height:1500px; margin-left:250px; background:#999; color:#fff;}

				#header{width:200px; position:fixed; left:50px; top:30px}

				#footer{width:550px; position:fixed; bottom:0}
				
				div#wrap div{
				float: left;
				}
				#login,#g_form{
					position: absolute;
					top: 500px;
					left: 500px;
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
				var s_id = document.forms[0].s_tel.value;
				var s_pwd = document.forms[0].s_pwd.value;
				
				if(s_id == ""){
					alert("아이디를 입력하세요");
					document.forms[0].id.focus();
					return;
				}
				if(s_pwd == ""){
					alert("비밀번호를 입력하세요");
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
	Object obj = session.getAttribute("login_ok");

	if(obj == null){
%>
		<div id="login">
			<div id="l_form">
				<form action="login.sc" method="post">
					<fieldset>
						<legend><img src="img/login.png"/></legend>
						<label for="m_id">TEL:</label>
						<input type="text" name="s_tel" id="s_tel" size="8" maxlength="14"/><br/>
						<label for="m_pwd">PW:</label>
						<input type="password" name="s_pwd" id="s_pwd" size="8"/><br/>
						
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
		
%>
		<div id="g_form">
			<span class="u_name">${vo.s_name }  </span>
			(<span class="u_id">${vo.s_tel }  </span>)님 환영합니다.
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
				<form action="reg.sc" method="post">
					<fieldset>
						<legend><img src="img/reg.png"/></legend>
						<table cellpadding="4" cellspacing="0">
							<tfoot>
								<tr>
									<td colspan="2" align="right">
										<input type="submit" value="회원가입"/>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td class="title"><label for="name"><img src="img/name.png"></label></td>
									<td><input type="text" name="s_name" id="s_name" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="id"><img src="img/gender.png"></label></td>
										<td><select name="s_gender">
											<option value="male">남</option>
											<option value="female">여</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="title"><label for="birth"><img src="img/birth.png"></label></td>
									<td><input type="text" name="s_birth" id="s_birth" size="8"/></td>
								</tr>
								<tr>
									<td class="title"><label for="phone"><img src="img/phone.png"></label></td>
									<td><select name="s_tel">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>-<input type="text" name="s_tel" id="s_tel" size="4"/>
									-<input type="text" name="s_tel" id="s_tel" size="4"/></td>
									<td>
									<img name="check" onclick="open()" src="img/check.png">
									</td>									
								</tr>
								<tr>
									<td class="title"><label for="pwd"><img src="img/pwd.png"></label></td>
									<td><input type="password" name="s_pwd" id="s_pwd" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="repwd"><img src="img/pwd.png"></label></td>
									<td><input type="password" name="repwd" id="repwd" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="nickname"><img src="img/nickname.png"></label></td>
									<td><input type="text" name="s_nickname" id="s_nickname" size="30"/></td>
								</tr>
								<tr>
									<td class="title"><label for="addr"><img src="img/addr.png"></label></td>
									<td><input type="text" name="s_addr" id="s_addr" size="30"/></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
			</div>
		
	</div>
<div id="header">
			<p><img src="img/happysilver.jpg" alt="배경" width="200px" height="200px"/>SilverCommunity</p>
			<ul>
				<li><img src="img/freeboard.png"></li>
				<li><a href="www.naver.com">PRODUCT</a></li>
				<li><a href="www.naver.com">CUSTOMER</a></li>
				<li><a href="www.naver.com">COMMUNITY</a></li>
			</ul>
		</div>

		<div id="container">
			<p>녹차는 은은한 향을 좋아하는 사람들이 애용하는 차이다.</p>
		</div>

		<div id="footer">
			<address>Copyright &copy; allright inc.</address>
		</div>

</body>
</html>