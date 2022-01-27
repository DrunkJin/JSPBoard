<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  </style>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>

	<form align="center" method="POST" action="loginAction.jsp">
        <p>
            아이디 : 
            <input type="text" name="userID" />
        <p>
        <p>
            비밀번호 : 
            <input type="password" name="userPassword" />
        <p>               
        <p><input type="submit" value="로그인"></p>
        
        
        <td><a style="text-decoration:none;" href="join.jsp">회원가입</td> 

</form>

</html>