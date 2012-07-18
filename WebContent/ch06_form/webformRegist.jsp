<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String method = request.getMethod();
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HTML5</title>
</head>
<body>
	<h1>등록 결과</h1>
	<p>
		요청방식: <%= method %><br>
		공개키: ${param.key}<br>
		언어: ${param.language}<br>
	</p>
</body>
</html>






