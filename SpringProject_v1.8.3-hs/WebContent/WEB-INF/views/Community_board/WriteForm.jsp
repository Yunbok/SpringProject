<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/resources/css/write&update.css" rel="stylesheet" type="text/css">
<title>커뮤니티게시판 글쓰기</title>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<jsp:include page="../navigation.jsp" />
	<c:if test="${!empty sessionScope.id}">
		<c:url var="insertUrl" value="/community_board_do_write.do" />
		<sf:form modelAttribute="boardBeanObjToWrite" method="post"
			action="${insertUrl}" enctype="multipart/form-data">
			<table id="contents_table" align="center" width="60%" cellpadding="1">
				<tr>
					<th width="40%" align="right">Categorie</th>
					<td width="60%" align="left">
						<select id="txt" name="kategorie">
							<option value="맛집" selected="selected">맛집</option>
							<option value="스터디">스터디</option>
							<option value="취업">취업</option>
						</select>
						<input type=hidden name="id" value="${sessionScope.id}" />
					</td>
				</tr>
				<tr>
					<th align="right">Writer</th>
					<td align="left"><sf:input id="txt" path="name" size="50" maxlength="50" readonly="true"/>
					</td>
				</tr>
				<tr>
					<th align="right">Subject</th>
					<td align="left"><sf:input id="txt" path="subject" size="50" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th align="right">File</th>
					<td align="left"><input id="txt_file" type="file" name="file" size="50" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th align="right">Contents</th>
					<td align="left">
						<sf:textarea id="txt_contents" path="contents" size="200" maxlength="200"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input id="btn" type="submit" value="Upload">
					</td>
				</tr>
			</table>
		</sf:form>
	</c:if>
</body>
</html>