<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Head.jsp" />
<c:if test="${!empty sessionScope.admin && sessionScope.admin == '1'}">
<c:url var="courupdateurl" value="/admin_course_update.do" />
	<sf:form modelAttribute="updateCourseBean" method="POST" action="${courupdateurl}">
	<table cellpadding="1" width="300" border="1">
		<tr>
			<td colspan="2"><p align="center">과목정보수정</p></td>
		</tr>
		<tr>
			<td width="100"><p align="center">과목코드</p></td>
			<td width="200">
				<p align="center"><sf:input path="code" readonly="true"/></p>
			</td>
		</tr>
		<tr>
			<td><p align="center">과목명</p></td>
			<td><p align="center"><sf:input path="cour_name"/></p></td>
		</tr>
		<tr>
			<td><p align="center">시작날짜</p></td>
			<td><p align="center"><sf:input path="start_date"/></p></td>
		</tr>
		<tr>
			<td><p align="center">종료날짜</p></td>
			<td><p align="center"><sf:input path="end_date"/></p></td>
		</tr>
		<tr>
			<td colspan="2"><p align="center">
			<input type="submit" value="수정">
			</p></td>
		</tr>
	</table>
	</sf:form>
	</c:if>
	<c:if test="${sessionScope.admin != '1' || empty sessionScope.admin}">
	<h1>권한이 없는 사용자의 잘못된 접근 입니다!</h1>
	</c:if>
</body>
</html>