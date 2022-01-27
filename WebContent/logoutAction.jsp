<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		alert('로그아웃 되셨습니다.');
		location.href = "main.jsp"
	</script>
</body>
</html>