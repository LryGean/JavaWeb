<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,java.lang.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC " - //W3C//DTD XHTML 1.0 Transitional//EN" "http:www.w3.org/TR/xhtmll/DTD/xhtmll - transitional.dtd">
<htmlxmlns = "http://www.w3.org/1999/xhtml">
	<head>
		<title>��¼</title>
		<meta http-equiv = "content-type" content = "text/html;charset=GB2312">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="������">
		<!--<meta http-equiv="refresh" content="10;login.html">-->
		<link rel="stylesheet" type="text/css" href="css.css">
		<link rel="stylesheet" type="text/css" href="screen512to1024.css" media="screen and (min-width:512px) and (max-width:1024px)">
		<link rel="icon" type="image/x-icon" href="img/ͼ��.jpg">
		<style>
			td{
				font-family: �����п�;
				font-size: 32px;
			}
			button{
				background-color: aliceblue;
				font-family: �����п�;
				font-size: 32px;
			}
			.five{
				font-family: �����п�;
				font-size: 32px;
			}
		</style>
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
		<!-- <div width="100%" height="1024px">&nbsp;</div> -->
		<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all">
			<tr bgcolor="#FF8C00">
				<%
					if(session.getAttribute("user")==null){
				%>
				<td width="8px">����δ</td>
				<td align="center" width="6px"><a href="login.jsp">��¼</a></td>
				<td align="center" width="6px"><a href="reg.jsp">ע��</a></td>
				<%
					}else{
						User loginUser = (User)session.getAttribute("user");
				%>
					 ���ã�<%=loginUser.getUserName() %>|<a href="doLogout.jsp">�ǳ�</a>
				<%
					 }
				%>
				<td width="256px"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					>> >><a href="index.jsp">��̳��ҳ</a>
				</td>
				<td>
					&nbsp;>> >>Gean</br>
				</td>
			</tr>
		</table>
		<center>
			<div class="five">
				<form action="check/cklogin.jsp" method="post">
					<table>
						<tr>�û�����<input type="text" name="username" /><br/><br/></tr>
						<tr>��&nbsp;&nbsp;�룺<input type="password" name="password" /><br/><br/></tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type = "submit" value = "��¼" /></td>
							<td><input type = "reset" value = "����" /></td>
							<td><button><a href = "reg.jsp">ע��</a></button></td>
						</tr>
					</table>
				</form>
				<%
					String error = request.getParameter("error");
					if(error!=null && error.equals("fail")){
						out.print("��¼ʧ�ܣ�");
					}
				%>
			</div>	
		</center>
	</body>
</html>

