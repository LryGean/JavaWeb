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
		<title>发帖</title>
		<meta name="author" content="李容宇">
		<!--<meta http-equiv="refresh" content="10;login.html">-->
		<link rel="stylesheet" type="text/css" href="css.css">
		<link rel="stylesheet" type="text/css" href="screen512to1024.css" media="screen and (min-width:512px) and (max-width:1024px)">
		<link rel="icon" type="image/x-icon" href="img/图标.jpg">
		<style>
			.one{
				font-family: 华文行楷;
				font-size: 32px;
			}
			.two{
				font-family: 华文行楷;
				font-size: 32px;
			}
			.three{
				background-color: aliceblue;
				font-family: 华文行楷;
				font-size: 32px;
			}
			.on{
				font-family: 华文行楷;
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
				font-family: 华文行楷;
				font-size: 48px;
			}
			textarea{
				width: 62.5rem;
				height: 31.25rem;
				font-family: 隶书;
				font-size: 16px;
			}
			.bz{
				font-size: 2rem;
				font-family: 黑体;
				color: #FF8C00;
			}
			.zy{
				font-family: 开题;
				font-size: 1rem;
				color: red;
			}
			button{
				font-family: 华文行楷;
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
					<td width="8px">您尚未</td>
					<td width="6px"><a href="login.jsp">登录</a></td>
					<td width="6px"><a href="reg.jsp">注册</a></td>
					<%
						}else{
							User loginUser = (User)session.getAttribute("user");
				 	%>
				 		您好：<%=loginUser.getUserName() %>|<a href="doLogout.jsp">登出</a>
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
							>> >><a href="index.jsp">论坛首页</a>
						</td>
						<td>
							&nbsp;>> >><u>C#语言</u></br>
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<div>
				<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="none">
					<tr bgcolor="#FF8C00" height="8px" class="one">
						<td width="20%">发表帖子</td>
						<td width="80%"></td>
					</tr>
					<tr height="8px">
						<td align="right" class="bz">标题</td>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" size="100" /></td>
					</tr>
					<tr height="1px">
						<td align="right" rowspan="3" class="bz">内容</td>
						<td rowspan="2"><input type="text" name="content" size="100" /></td>
					</tr>
					<tr height="64px">
						<td></td>
					</tr>
					<tr>
						<td class="zy">（不能超过1000字）</td>
						<td></td>
					</tr>
				</table>
			</div>
			<center>
				<table>
					<tr>
						<td class="an"><input type="submit" value="提交"></td>
						<td class="an"><button><a href="post.jsp">重写</a></button></td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>
