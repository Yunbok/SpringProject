<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.solnamu.yb.dto.UserBean, java.util.*, java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/resources/css/write&update.css" rel="stylesheet" type="text/css">
<link href="/resources/css/banner.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<jsp:include page="../navigation.jsp" />
	<div id="banner">
		<img id="banner_img" src="./resources/img/banner.png">
		<label id="banner_label" ></label>
	</div>
	<c:url var="updateurl" value="/user_info_update.do" />
	<sf:form modelAttribute="userInfoUpdateBean" method="POST" action="${updateurl}">
	<table id="contents_table" cellpadding="1" width="60%" align="center">
		<thead>
		<tr>
			<th colspan="2"><p align="center">Revice Information</p></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th width="40%"><p align="right">I&nbsp;&nbsp;D</p></th>
			<td width="60%"><p align="left"><sf:input id="txt" path="id" readonly="true"/></p></td>
		</tr>
		<tr>
			<th><p align="right">Password</p></th>
			<td><p align="left"><sf:password id="txt" path="pw"/></p></td>
		</tr>
		<tr>
			<th><p align="right">Confirm password</p></th>
			<td><p align="left"><sf:password id="txt" path="rePw"/></p></td>
		</tr>
		<tr>
			<th><p align="right">Name</p></th>
			<td><p align="left"><sf:input id="txt" path="name" readonly="true"/></p></td>
		</tr>
		<tr>
			<th><p align="right">Courses</p></th>
			<td><p align="left"><sf:input id="txt" path="cour_name" readonly="true"/></p></td>
		</tr>
		<tr>
			<th><p align="right">Birthday</p></th>
			<td><p align="left"><sf:input id="txt" path="birthday"/></p></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="2"><p align="center">
			<input id="btn" type="submit" value="Update Information">
			</p></td>
		</tr>
		</tfoot>
	</table>
	</sf:form>
</body>
</html>