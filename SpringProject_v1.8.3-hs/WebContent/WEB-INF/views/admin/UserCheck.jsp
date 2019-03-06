<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ȸ�� ���� ����</title>
</head>

<script type="text/javascript">
	function deleteuser() {

		alert("����");
		UserCheck.select.value = 1
		UserCheck.submit()
	}

	function okuser() {
		alert("����");
		UserCheck.select.value = 0
		UserCheck.submit()

	}
</script>
<body>
	<jsp:include page="../Head.jsp" />
	<c:if test="${!empty sessionScope.admin && sessionScope.admin == '1'}">
	<h1>������ ������</h1>
	<h2>ȸ������ ��û �Ǽ� : ${MemberCount}</h2>
	<form name="UserCheck" action="admin_usercheck.do" method="post">
		<Table border="1">

			<tr>
				<td>���̵�</td>
				<td>�̸�</td>
				<td>�������</td>
				<td>���¸�</td>
				<td>����</td>
				<td>����</td>
				<!-- ���̵� pk
					��й�ȣ
					�̸�
					�������
					�����ڵ� fk
					�����ڱ��� -->
			</tr>
			<c:forEach items="${MemberList}" var="member">
				<tr>
					<td>${member.getId()}</td>
					<td>${member.getName()}</td>
					<td>${member.getBirthday()}</td>
					<td>${member.getCour_name()}</td>
					<c:if test="${member.getAdministrator() == 1}" >
						<td><c:out value="������" /></td>
					</c:if>
					<c:if test="${member.getAdministrator() != 1}" >
						<td><c:out value="ȸ��" /></td>
					</c:if>
					<td><input type="checkbox" name="check" value="${member.getId()}"></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5">
				<input type="hidden" name="select" value="0">
				<input type="button" name="OK" onclick="okuser()" value="����"> 
				<input type="button" name="delete" onclick="deleteuser()" value="����">
				</td>
			</tr>
		</Table>
	</form>
	</c:if>
	<c:if test="${sessionScope.admin != '1' || empty sessionScope.admin}">
	<h1>������ ���� ������� �߸��� ���� �Դϴ�!</h1>
	</c:if>
</body>
</html>