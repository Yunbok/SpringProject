<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 - 회원 정보 보기</title>
</head>
<body>
	<jsp:include page="../Head.jsp" />
	<c:if test="${!empty sessionScope.admin && sessionScope.admin == '1'}">
<h1>
	관리자 페이지 
</h1>
<script type="text/javascript">
function deleteuser(){
	
	alert("유저 삭제");
	UserCheck.select.value = 1;
	UserCheck.submit();
}

function pwreset(){
	alert("비밀번호 초기화");
	UserCheck.select.value = 0;
	UserCheck.submit();
	
}
function adminuser(){
	alert("관리자 권한 부여");
	UserCheck.select.value = 2;
	UserCheck.submit();
}


</script>

<h2>유저 수 : ${MemberCount}</h2>
<form name="UserCheck" action="admin_userupdate.do" method="post">
		<Table border="1">

			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>강좌명</td>
				<td>권한</td>
				<td>선택</td>
				<!-- 아이디 pk
					비밀번호
					이름
					생년월일
					강좌코드 fk
					관리자권한 -->
			</tr>
			<c:forEach items="${MemberList}" var="member">
				<tr>
					<td>${member.getId()}</td>
					<td>${member.getName()}</td>
					<td>${member.getBirthday()}</td>
					<td>${member.getCour_name()}</td>
					<c:if test="${member.getAdministrator() == 1}" >
						<td><c:out value="관리자" /></td>
					</c:if>
					<c:if test="${member.getAdministrator() != 1}" >
						<td><c:out value="회원" /></td>
					</c:if>
					<td><input type="checkbox" name="check" value="${member.getId()}"></td>
				</tr>
			</c:forEach>

			
		</Table>
		<input type="hidden" name="select" value="0">
		<input type="button" name="OK" onclick ="pwreset()" value="비밀번호 초기화">
		<input type="button" name="delete" onclick ="deleteuser()" value="회원 삭제">
		<input type="button" name="admin" onclick ="adminuser()" value="관리자부여">
		</form>
		</c:if>
	<c:if test="${sessionScope.admin != '1' || empty sessionScope.admin}">
	<h1>권한이 없는 사용자의 잘못된 접근 입니다!</h1>
	</c:if>
</body>
</html>