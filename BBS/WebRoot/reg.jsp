<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>ע�����</title>
		<!--<meta http-equiv="refresh" content="5;http://fishc.taobao.com">-->
		<link rel="icon" type="image/x-icon" href="img/ͼ��.jpg">
		<body style="background: url(img/����2.png);"></body>
	</head>
	<body>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<h1 align="center">�û�ע��</h1>
		<!--��-->
		<form name="regForm" method="post" action="check/ckreg.jsp">
			<center>
				<table border="0">
				
					<!-- �û��� -->
					<tr>
						<td align="right">�û�����</td>
						<td align="left"><input type="text" name="username"/></td>
					</tr>
					
					<!-- ���� -->
					<tr>
						<td align="right">��&nbsp;&nbsp;&nbsp;�룺</td>
						<td align="left"><input type="password" name="password"/></td>
					</tr>
					
					<!-- ���� -->
					<tr>
						<td align="right">��&nbsp;&nbsp;&nbsp;�䣺</td>
						<td align="left"><input type="text" name="mailbox"/></td>
					</tr>
					
					<!-- �ֻ��� -->
					<tr>
						<td align="right">�ֻ��ţ�</td>
						<td align="left"><input type="text" name="tel"/></td>
					</tr>
					
					<!-- �Ա� -->
					<tr>
						<td align="right">�Ա�</td>
						<td align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" checked="checked"/>��
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1"/>Ů
						</td>
					</tr>
					
					<!-- ���� -->
					<tr>
						<!--��ѡ��radio-->
						<td align="right">���ã�</td>
						<td align="center">
							<input type="checkbox" name="hobby" value="����" />����
							<input type="checkbox" name="hobby" value="����" />����
							<input type="checkbox" name="hobby" value="����" />����
							<input type="checkbox" name="hobby" value="��Ϸ" checked="checked" />��Ϸ
						</td>
					</tr>
					
					<!-- ���� -->
					<tr>
						<!--��ѡ��option-->
						<td align="right">���У�</td>
						<td>
							<select name="city">
								<option>��ѡ��</option>
								<option value="����">����</option>
								<option value="�Ϻ�">�Ϻ�</option>
								<option value="���">���</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�㽭">�㽭</option>
							</select>
						</td>
					</tr>
					
					<!-- ���ҽ��� -->
					<tr>
						<!--�����ı�-->
						<td align="right">���ҽ��ܣ�</td>
						<td width="50%"><textarea style="resize: none;" rowspan="10" colspan="10" name="self"></textarea></td>
					</tr>
					<tr>
						<td align="right">ע�⣺</td>
						<td width="50%">100������</td>
					</tr>
					
					<!-- ͷ�� -->
					<tr>
						<td align="right">ͷ��</td>
						<td align="left">
							<input type="radio" name="head" value="1.png"><img alt="1" src="img/1.png" width="50px" heigth="100px">
							<input type="radio" name="head" value="2.png"><img alt="2" src="img/2.png" width="50px" heigth="100px">
							<input type="radio" name="head" value="3.png"><img alt="3" src="img/3.png" width="50px" heigth="100px">
							<input type="radio" name="head" value="4.png"><img alt="4" src="img/4.png" width="50px" heigth="100px">
						</td>
					</tr>
					<tr>
						<td align="right">
							<input type="submit" name="submit" value="ע��" />&nbsp;&nbsp;
							<input type="reset" name="reset" value="ȡ��" />
						</td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>
