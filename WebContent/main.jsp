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
<!-- ���̺�� ���� ��� ���� -->
<table align = "center">
	<tr>
	<td><div id="main-title">���� ������</div></td>
	</tr>
</table>
<table align = "center" width:60% height = "800" margin:auto>
	<% 
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	%>

	<td><a style="text-decoration:none; margin-top:4%" href="logoutAction.jsp">�α׾ƿ�</td>
	
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%" href="board.jsp">�Խ���</td>
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%;" href="join.jsp">ȸ������</td> 
	
	<% 
	}else{
		userID = (String)session.getAttribute("userID");
	%>

	<td><a style="text-decoration:none; margin-top:4%" href="login.jsp">�α���</td>
	
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%" href="board.jsp">�Խ���</td>
	<td><pre>  |  </pre></td>
	<td><a style="text-decoration:none; margin-top:4%;" href="join.jsp">ȸ������</td> 
	
	<% 
	}
	%>
</table>
</body>
</html>