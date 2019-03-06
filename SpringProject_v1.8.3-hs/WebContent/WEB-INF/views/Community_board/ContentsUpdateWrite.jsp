<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/board.js" charset="utf-8"></script>
<link href="/resources/css/write&update.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>커뮤니티 게시글 수정</title>
<script type="text/javascript">
	function writeCheck() {
		var form = document.modifyform;
		if (!form.dbsubject.value) {
			alert("제목을 적어주세요");
			form.dbsubject.focus();
			return;
		}
		if (!form.dbmemo.value) {
			alert("내용을 적어주세요");
			form.dbmemo.focus();
			return;
		}
		form.submit();
	}
	function boardlist() {
		location.href = 'community_board_list.do?offset=0&pagelink=1';
	}
	
	function select(){
		$("#kategorie").val("${boardData.getKategorie()}").attr("selected","selected")
	}
</script>
</head>
<body onload="select()">
	<jsp:include page="../Head.jsp" />
	<jsp:include page="../navigation.jsp" />
	<c:if test="${sessionScope.id == boardData.getId() }" >
	<c:url var="updateurl" value="/community_board_update.do" />
	<sf:form name="form" modelAttribute="boardData" method="POST" action="${updateurl}" enctype="multipart/form-data">
		<table align="center" width="60%" cellpadding="1">
			<tr>
				<th width="40%" align="right">Categorie</th>
				<td width="60%" align="left">
					<select id="txt" name="kategorie">
						<option value="맛집">맛집</option>
						<option value="스터디">스터디</option>
						<option value="취업">취업</option>
					</select>
				</td>
			</tr>
			<tr>
				<th align="right">Writer</th>
				<td align="left">
					<input type="hidden" name="no" value="${no}">
					<input type=hidden name="id" value="${sessionScope.id}"/>
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
				<th align="right">File</th>
				<td align="left"><input id="txt_file" type="file" name="file" size="50" maxlength="50" />
				<c:if test="${boardData.fileName != ''}">
					<br><label id="file_label">현재 파일 : </label><span id="prev_file">${boardData.fileName}</span>
				</c:if>
				</td>
			</tr>
			<tr>
				<th align="right">Contents</th>
				<td align="left"><sf:textarea id="txt_contents" path="contents" size="200"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input id="btn" type="submit" value="Update Contents">
				</td>
			</tr>
		</table>
	</sf:form>
	</c:if>
	<c:if test="${empty sessionScope.id || sessionScope.id != boardData.getId() }">
		<h1>잘못된 접근입니다.</h1>
	</c:if>
</body>
</html>