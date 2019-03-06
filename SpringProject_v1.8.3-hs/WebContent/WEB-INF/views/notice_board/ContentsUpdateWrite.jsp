<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/board.js" charset="utf-8"></script>
<link href="/resources/css/write&update.css" rel="stylesheet" type="text/css">
<title>������ ����</title>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<jsp:include page="../navigation.jsp" />
	<c:if test="${sessionScope.admin == 1 }" >
	<c:url var="updateurl" value="/notice_board_update.do" />
	<sf:form name="updateWriteForm" modelAttribute="boardData" method="POST" action="${updateurl}">
		<table id="contents_table" width="60%" cellpadding="1" align="center">
			<tr>
				<th width="40%" align="right">Writer</th>
				<td width="60%" align="left">
					<input type="hidden" name="no" value="${no}">
					<input type="hidden" name="offset" value="${offset}"/>
					<input type="hidden" name="pagelink" value="${pagelink}"/>
					<sf:input id="txt" readonly="true" path="name" size="50" />
				</td>
			</tr>
			<tr>
				<th align="right">Subject</th>
				<td align="left"><sf:input id="txt" path="subject" size="50" maxlength="50" /></td>
			</tr>
			<tr>
				<th align="right">Contents</th>
				<td align="left"><sf:textarea id="txt_contents" path="contents" size="200" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input id="btn" type="button" value="Update Contents" onclick="updateWriteCheck()">
				</td>
			</tr>
		</table>
	</sf:form>
	</c:if>
	<c:if test="${empty sessionScope.id || sessionScope.admin != 1 }">
		<h1>�߸��� �����Դϴ�.</h1>
	</c:if>
</body>
</html>