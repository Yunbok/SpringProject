<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function insert_cour(){
		document.location.href='/admin_course_write_form.do';
	}
	function update_cour(code){
		document.location.href='/admin_course_update_form.do?code='+code;
	}
	function delete_cour(code){
		document.location.href='/admin_course_delete.do?code='+code;
	}
</script>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<c:if test="${!empty sessionScope.admin && sessionScope.admin == '1'}">
	<table border="1">
		<tr>
			<td width="50"><p align="center">�����ڵ�</p></td>
			<td width="200"><p align="center">�����</p></td>
			<td width="125"><p align="center">���۳�¥</p></td>
			<td width="125"><p align="center">���ᳯ¥</p></td>
			<td colspan="2" align="center"><input type="button" value="�۾���"
				onclick="insert_cour()"></td>
		</tr>

		<c:forEach var="course" items="${CourseList}">
			<tr>
				<td width="50"><p align="center">${course.getCode()}</p></td>
				<td width="200"><p align="center">${course.getCour_name()}</p></td>
				<td width="125"><p align="center">${course.getStart_date()}</p></td>
				<td width="125"><p align="center">${course.getEnd_date()}</p></td>
				<td><input type="button" value="����"
					onclick="update_cour(${course.getCode()})"></td>
				<td><input type="button" value="����"
					onclick="delete_cour(${course.getCode()})"></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${sessionScope.admin != '1' || empty sessionScope.admin}">
	<h1>������ ���� ������� �߸��� ���� �Դϴ�!</h1>
	</c:if>
</body>
</html>