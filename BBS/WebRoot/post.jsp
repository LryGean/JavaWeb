<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int boardId = Integer.parseInt(request.getParameter("boardId"));
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>����</title>
		<meta name="author" content="������">
		<!--<meta http-equiv="refresh" content="10;login.html">-->
		<link rel="stylesheet" type="text/css" href="css.css">
		<link rel="stylesheet" type="text/css" href="screen512to1024.css" media="screen and (min-width:512px) and (max-width:1024px)">
		<link rel="icon" type="image/x-icon" href="img/ͼ��.jpg">
		<style>
			.one{
				font-family: �����п�;
				font-size: 32px;
			}
			.two{
				font-family: �����п�;
				font-size: 32px;
			}
			.three{
				background-color: aliceblue;
				font-family: �����п�;
				font-size: 32px;
			}
			.on{
				font-family: �����п�;
				font-size: 28px;
			}
			.four{
				border-collapse: collapse;
				border: 1px solid lightblue;
				background-color: #FFFFFF ;
				border-color: aliceblue;
			}
			input{
				height: 3rem;
				background-color: antiquewhite;
				font-family: �����п�;
				font-size: 48px;
			}
			textarea{
				width: 62.5rem;
				height: 31.25rem;
				font-family: ����;
				font-size: 16px;
			}
			.bz{
				font-size: 2rem;
				font-family: ����;
				color: #FF8C00;
			}
			.zy{
				font-family: ����;
				font-size: 1rem;
				color: red;
			}
			button{
				font-family: �����п�;
				font-size: 32px;
				color: aqua;
				background-color: #FF8C00;
			}
		</style>
	</head>
	<body>
		<br/>
		<br/>
		<br/>
		<br/>
		<br>
		<br>
		<br/>
		<br/>
		<br/>
		<div width="100%" height="1024px">&nbsp;</div>
		<div class="one">
			<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all">
				<tr bgcolor="#FF8C00">
					<%
						if(session.getAttribute("user")==null){
					%>
					<td width="8px">����δ</td>
					<td width="6px"><a href="login.jsp">��¼</a></td>
					<td width="6px"><a href="reg.jsp">ע��</a></td>
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
		</div>
		<br/>
		<form name="postForm" onsubmit="return check()" action="manage/doPost.jsp" method="POST">	
			<div class="two">
				<input type="hidden" name="boardId"value="<%=boardId %>">
				<table>
					<tr>
						<td>
							>> >><a href="index.jsp">��̳��ҳ</a>
						</td>
						<td>
							&nbsp;>> >><u>C#����</u></br>
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<div>
				<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="none">
					<tr bgcolor="#FF8C00" height="8px" class="one">
						<td width="20%">��������</td>
						<td width="80%"></td>
					</tr>
					<tr height="8px">
						<td align="right" class="bz">����</td>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" size="100" /></td>
					</tr>
					<tr height="1px">
						<td align="right" rowspan="3" class="bz">����</td>
						<td rowspan="2"><input type="text" name="content" size="100" /></td>
					</tr>
					<tr height="64px">
						<td></td>
					</tr>
					<tr>
						<td class="zy">�����ܳ���1000�֣�</td>
						<td></td>
					</tr>
				</table>
			</div>
			<center>
				<table>
					<tr>
						<td class="an"><input type="submit" value="�ύ"></td>
						<td class="an"><button><a href="post.jsp">��д</a></button></td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>
