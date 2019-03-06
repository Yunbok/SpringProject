var pattern_num = /[0-9]/; // 숫자 체크
var pattern_eng = /[a-zA-Z]/; // 문자 체크
var pattern_spc = /[`~!@#$%^&*|\\\'\";:\/?]/gi; // 특수문자 체크
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글 체크
var pattern_blank = /[\s]/g; // 공백 체크

var idFlag = 0;

//아이디 체크
function idCk() {

	$.ajax({
		url : "idCheck.do",
		type : "POST",
		data : { id : $("#id").val() },
		dataType : "json",
		success : function(idCheckResult) {
			
			if (document.signUpForm.id.value == "") {
				alert("아이디를 입력하세요");
				return;
			} else if (pattern_blank.test(document.signUpForm.id.value) == true) {
				alert("아이디에 공백은 사용할 수 없습니다.");
				return;
			} else if (pattern_kor.test(document.signUpForm.id.value) == true) {
				alert("아이디에 한글은 사용할 수 없습니다.");
				return;
			} else if (idCheckResult.checkID > 0) {
				alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				$("#id").css("border-color", "#FF0000").css("border-width", "5px");
				return;
			} else {
				alert("사용가능한 아이디입니다.");
				$("#id").css("border-color", "#00FF00").css("border-width", "5px");
				$("#passwd").focus();
				idFlag = 1;
				return;
			}
		},
		error : function(request, status, error) {
			alert("codes : " + request.status + "\r\nmessage : "
					+ request.reponseText + "\r\nerror : " + error);
		}
	});
}

// 회원가입 기입내용 체크

function inputCheck() {

	if (document.signUpForm.id.value == "") {
		alert("아이디를 입력하세요");
		return;
	}
	if (document.signUpForm.pw.value == "") {
		alert("비밀번호를 입력하세요");
		document.signUpForm.pw.focus();
		return;
	}
	if (document.signUpForm.pw.value.length < 12) {
		alert("비밀번호를 12자리 이상 입력하세요");
		document.signUpForm.pw.focus();
		return;
	}
	if (document.signUpForm.rePw.value == "") {
		alert("비밀번호 확인을 입력하세요");
		document.signUpForm.rePw.focus();
		return;
	}
	if (document.signUpForm.name.value == "") {
		alert("이름을 입력하세요");
		document.signUpForm.name.focus();
		return;
	}
	if (pattern_num.test(document.signUpForm.name.value) == true || pattern_eng.test(document.signUpForm.name.value) == true ||
			pattern_spc.test(document.signUpForm.name.value) == true || pattern_blank.test(document.signUpForm.name.value) == true) {
		alert("이름은 한글만 입력 가능합니다.");
		document.signUpForm.name.focus();
		return;
	}
	if (document.signUpForm.birthday.value == "") {
		alert("생년월일을 입력하세요");
		document.signUpForm.birthday.focus();
		return;
	}
	if (pattern_kor.test(document.signUpForm.birthday.value) == true || pattern_eng.test(document.signUpForm.birthday.value) == true ||
			 pattern_blank.test(document.signUpForm.birthday.value) == true) {
		alert("생년월일은 숫자만 입력 가능합니다.");
		document.signUpForm.birthday.focus();
		return;
	}
	if (document.signUpForm.birthday.value.length < 8) {
		alert("생년월일 8자리를 정확히 입력하세요");
		document.signUpForm.birthday.focus();
		return;
	}
	if (document.signUpForm.pw.value != document.signUpForm.rePw.value) {
		alert("비밀번호가 같지 않습니다. 비밀번호를 다시 확인해주세요.");
		document.signUpForm.rePw.focus();
		return;
	}
	if (idFlag == 0 ) {
		alert("아이디를 확인해주세요.");
		return;
	} 
	
	document.signUpForm.submit();
	
}