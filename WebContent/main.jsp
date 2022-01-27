<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#main-title{
	font-size:70pt;
	margin-top:20%
	}
</style>
<meta charset="EUC-KR">
<title>WebProject</title>
</head>
<body>
<!-- 테이블로 글자 가운데 정렬 -->
<table align = "center">
	<tr>
	<td><div id="main-title">메인 페이지</div></td>
	</tr>
</table>
<table align = "center" width:60% height = "800" margin:auto>
	<% 
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	%>

	<td><a style="text-decoration:none; margin-top:4%" href="logoutAction.jsp">로그아웃</td>
	
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%" href="board.jsp">게시판</td>
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%;" href="join.jsp">회원가입</td> 
	
	<% 
	}else{
		userID = (String)session.getAttribute("userID");
	%>

	<td><a style="text-decoration:none; margin-top:4%" href="login.jsp">로그인</td>
	
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%" href="board.jsp">게시판</td>
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%;" href="join.jsp">회원가입</td> 
	
	<% 
	}
	%>
</table>
</body>
</html>