<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
<form align="center" method="POST" action="joinAction.jsp">
        <p>
            아이디 : 
            <input type="text" name="userID" />
        <p>
        <p>
            비밀번호 : 
            <input type="password" name="userPassword" />
        <p>       
        <p>
            이름 : 
            <input type="text" name="userName" />
        <p>  
        <p>
            성별(남성/여성) : 
            <input type="text" name="userGender" />
        <p>
        <p>
            이메일 : 
            <input type="text" name="userEmail" />
        <p>  
                
        <p><input type="submit" value="회원가입"></p>
        </form>
</body>
</html>