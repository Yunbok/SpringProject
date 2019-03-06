<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۺ���</title>

<script type="text/javascript">
	function hideshow(no) {
	  var x = document.getElementById("InputTR_"+no);
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
	function boardmodify(no,offset,pagelink){
		if(${boardData.getId() == sessionScope.id}){
			document.location.href = "debug_board_update_form.do?no="+no+"&offset="+offset+"&pagelink="+pagelink;
		}else{
			alert("���������� �����ϴ�.");
		}
	}
	function boarddelete(no){
		if(${boardData.getId() == sessionScope.id || sessionScope.admin == 1} ){
			
		document.location.href = "debug_board_delete.do?no="+no;
		}else{
			alert("���������� �����ϴ�.");
		}
	}
	function submit2(form){
		if(form.content.value == ""){
			alert("����� �Է��ϼ���.")
		}else{
			form.submit()
		}
		
	}
	function backlist(offset, pagelink){
		document.location.href = "/debug_board_list.do?offset="+offset+"&pagelink="+pagelink;
	}
</script>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<c:if test="${!empty sessionScope.id}" >
	<table cellspacing="0" cellpadding="5" border="1" width="500">
		<tr>
			<td><b>��ȸ��</b></td>
			<td><c:out value="${boardData.getViews()}" /></td>
		</tr>
		<tr>
			<td><b>�̸�</b></td>
			<td><c:out value="${boardData.getName()}" /></td>
		</tr>
		<tr>
			<td><b>����</b></td>
			<td><c:out value="${boardData.getSubject()}" /></td>
		</tr>
		<tr>
			<td><b>����</b></td>
			<td><c:out value="${boardData.getFileName()}" /></td>
		</tr>
		<tr>
			<td><b>����</b></td>
			<td><c:out value="${boardData.getContents()}" /></td>
		</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" width="500">
		<tr>
			<td>
				<input type="button" value="����" onclick="javascript:boardmodify(${boardData.getNo()},${offset},${pagelink})"> 
				<input type="button" value="�ڷΰ���" onclick="javascript:backlist(${offset},${pagelink})">		
				<input type="button" value="����" onclick="javascript:boarddelete(${boardData.getNo()})">
			</td>
		</tr>
		<form action="/debug_board_reply.do" method="POST">
		<tr>
			<td><b>���</b></td>
			<td>
				<textarea name="content" Style="width:350px;height=100px;"></textarea>
				<input type="hidden" name="no" value="${boardData.getNo()}">
				<input type="hidden" name="writer" value="����">
				<input type="hidden" name="offset" value="${offset}">
				<input type="hidden" name="pagelink" value="${pagelink}">
			</td>
			<td><input type="button" onclick="submit2(this.form)" value="��۴ޱ�" ></td>
		</tr>
		</form>	
	</table>
	
	<div>
		<table border="1">
			<c:forEach var="reply" items="${replyData}">
			<tr>
				<td><c:out value="${reply.rno}" /></td>
				<td><c:out value="${reply.content}" /></td>
				<td><c:out value="${reply.writer}" /></td>
				<td><input type="button" onclick="hideshow(${reply.rno})" value="��۾���"></td>
			</tr>
		
				<c:forEach var="rereply" items="${rereplyData}">
				<c:if test="${reply.rno == rereply.rno }">
				<tr>
					<td><c:out value="-->${rereply.sno}" /></td>
					<td><c:out value="${rereply.content}" /></td>
					<td colspan="2"><c:out value="${rereply.writer}" /></td>
				</tr>
				</c:if>
				</c:forEach>
				<tr id="InputTR_${reply.rno}" style="display:none">
				<form action="debug_board_rereply.do" method="post">
					<td colspan="2"><input type="text" name="content">
					<input type="hidden" name="no" value="${boardData.no}">
					<input type="hidden" name="rno" value="${reply.rno}">
					<input type="hidden" name="offset" value="${offset}">
					<input type="hidden" name="pagelink" value="${pagelink}"></td>
					<td><input type="button" onclick="submit2(this.form)" value="��۴ޱ�"></td>
				</form>
			</tr> 
			</c:forEach>
		</table>
	</div>
	</c:if>
</body>
</html>