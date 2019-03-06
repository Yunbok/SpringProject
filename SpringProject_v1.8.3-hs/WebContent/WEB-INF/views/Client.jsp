<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>${course_name} ä�ù�</title>
</head>
<body>
	<h1>${course_name} ä�ù�</h1>
	<jsp:include page="Head.jsp" />
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>
</body>
    <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8080/${code}');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        textarea.value += event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "���� ����\n";
    }
    function onError(event) {
    	
    	
      alert(event.data);
    }
    function send() {
        textarea.value += "�� : " + inputMessage.value + "\n";
        webSocket.send("${sessionScope.id} : "+inputMessage.value);
        inputMessage.value = "";
    }
    function list(){
    	window.location.href="http://localhost:8080/main.do"
    }
    
  </script>
</html>