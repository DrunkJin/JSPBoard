<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  </style>
<meta charset="EUC-KR">
<title>�Խ���</title>
</head>
<body>
	<% 
		// ���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>

			<form align="center" name="form" method="post" action="writeAction.jsp" entype="multipart/form-data">
			<table align="center" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">�Խ��� �۾��� ���</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="�� ����" name="bbsTitle" maxlength="50" style="width: 1000px"></td>
					</tr>
					<tr>
						<td><textarea placeholder="�� ����" name="bbsContent" maxlength="2048" style="height: 350px; width: 1000px"></textarea></td>
					</tr>
				</tbody>
			</table>
				<input type="submit" value="�ۼ��ϱ�">
		</form>
		<p align="center">file: <input type="file" name="file"></p>
					
	</table>
</body>
</html>