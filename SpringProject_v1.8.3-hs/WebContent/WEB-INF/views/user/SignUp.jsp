<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 가입</title>

<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/signUp.js"
	charset="utf-8"></script>
<link href="/resources/css/SignUp.css" rel="stylesheet" type="text/css">
</head>

<body id="loginNo">
	<div id="container">
		<c:url var="insertUrl" value="/user_signUp_insert.do" />
		<sf:form name="signUpForm" modelAttribute="signUpWrite" method="post"
			action="${insertUrl}">
			<table align="center" id="logo">
				<tr>
						<td colspan="2" align="center"><img
							src="/resources/img/SOLNAMU.png" /> <br /> <br /></td>
				</tr>
				<tr>
					<td colspan="2"><label><b>아이디</b></label><br /> <br />
					<sf:input id="id" path="id" size="50" maxlength="20"
							placeholder="ex)soldesk@naver.com" onblur="idCk()" /> <br />
				</tr>
				<tr>
					<td colspan="2"><label><b>비밀번호</b></label><br /> <br />
					<sf:input type="password" path="pw" size="50" maxlength="15" /><br />
				</tr>
				<tr>
					<td colspan="2"><label><b>비밀번호 확인</b></label><br /> <br />
					<sf:input type="password" path="rePw" size="50" maxlength="15" /><br />
				</tr>
				<tr>
					<td colspan="2"><label><b>이름</b></label><br /> <br />
					<sf:input path="name" size="50" maxlength="10" /><br />
				</tr>
				<tr>
					<td colspan="2"><label><b>생년월일</b></label><br /> <br />
					<sf:input id="birthday" path="birthday" size="50" maxlength="8"
							placeholder="ex)19950612" /><br />
				</tr>
				<tr>
					<td><label><b>강좌명</b></label><br /> <br /><sf:select id="select" path="cour_name">
							<c:forEach var="cl" items="${courseList}">
								<option id="option" value="${cl.cour_name}">${cl.cour_name}</option>
							</c:forEach>
						</sf:select>
						
						<td align="right"><label><b></b></label><br /> <br />
						<input id="reset" type="reset" value="다시 입력"></td>
						</tr>
				<tr>
					<td colspan="2" align="center"><input id="SignUp" type="button" value="Sign Up"
						onclick="inputCheck()">   
					</td>

				</tr>
			</table>
		</sf:form>
	</div>
</body>
</html>