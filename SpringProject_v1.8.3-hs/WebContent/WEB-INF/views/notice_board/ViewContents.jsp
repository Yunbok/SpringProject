<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지글 보기</title>

<script type="text/javascript">
	function hideshow(no) {
	  var x = document.getElementById("InputTR_"+no);
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
	function boardmodify(no,offset,pagelink{
		document.location.href = "notice_board_update_form.do?no="+no+"&offset="+offset+"&pagelink="+pagelink;;
	}
	function boarddelete(no){
		document.location.href = "notice_board_delete.do?no="+no;
	}
	function backlist(offset, pagelink){
		document.location.href = "/notice_board_view_contents.do?offset="+offset+"&pagelink="+pagelink;
	}
</script>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<table cellspacing="0" cellpadding="5" border="1" width="500">
		<tr>
			<td width="130px" align="center"><b>조회수</b></td>
			<td><c:out value="${boardData.views}" /></td>
		</tr>
		<tr>
			<td align="center"><b>이름</b></td>
			<td><c:out value="${boardData.name}" /></td>
		</tr>
		<tr>
			<td align="center"><b>제목</b></td>
			<td><c:out value="${boardData.subject}" /></td>
		</tr>
		<tr>
			<td align="center"><b>내용</b></td>
			<td width="1000px" height="500px"><c:out value="${boardData.contents}" /></td>
		</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" width="500">
		<tr>
			<td>
			<c:if test="${sessionScope.admin == 1}">
				<input type="button" value="수정" onclick="javascript:boardmodify(${boardData.no},${offset},${pagelink})"> 
				<input type="button" value="뒤로가기" onclick="javascript:backlist(${offset},${pagelink})">
				<input type="button" value="삭제" onclick="javascript:boarddelete(${boardData.no})">
			</c:if>
			<c:if test="${sessionScope.admin == 0}">
				<input type="button" value="뒤로가기" onclick="javascript:history.back()">
			</c:if>
			</td>
		</tr>
	</table>

</body>
</html>