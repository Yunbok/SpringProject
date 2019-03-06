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
	<c:url var="courinserturl" value="/admin_course_insert.do" />
	<sf:form modelAttribute="WriteCourseBean" method="POST" action="${courinserturl}">
	<table cellpadding="1" width="300" border="1">
		<tr>
			<td colspan="2"><p align="center">�����������</p></td>
		</tr>
		<tr>
			<td width="100"><p align="center">�����ڵ�</p></td>
			<td width="200"><p align="center"><sf:input path="code"/></p></td>
		</tr>
		<tr>
			<td><p align="center">�����</p></td>
			<td><p align="center"><sf:input path="cour_name"/></p></td>
		</tr>
		<tr>
			<td><p align="center">���۳�¥</p></td>
			<td><p align="center"><sf:input path="start_date"/></p></td>
		</tr>
		<tr>
			<td><p align="center">���ᳯ¥</p></td>
			<td><p align="center"><sf:input path="end_date"/></p></td>
		</tr>
		<tr>
			<td colspan="2"><p align="center">
			<input type="submit" value="���">
			</p></td>
		</tr>
	</table>
	</sf:form>
	</c:if>
	<c:if test="${sessionScope.admin != '1' || empty sessionScope.admin}">
	<h1>������ ���� ������� �߸��� ���� �Դϴ�!</h1>
	</c:if>
</body>
</html>