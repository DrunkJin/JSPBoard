<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  </style>
<meta charset="EUC-KR">
<title>게시판</title>
</head>
<body>
	<% 
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>

			<form align="center" name="form" method="post" action="writeAction.jsp" entype="multipart/form-data">
			<table align="center" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50" style="width: 1000px"></td>
					</tr>
					<tr>
						<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px; width: 1000px"></textarea></td>
					</tr>
				</tbody>
			</table>
				<input type="submit" value="작성하기">
		</form>
		<p align="center">file: <input type="file" name="file"></p>
					
	</table>
</body>
</html>