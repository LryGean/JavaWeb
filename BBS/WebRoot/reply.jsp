<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int topicId = Integer.parseInt(request.getParameter("topicId"));
int boardId = Integer.parseInt(request.getParameter("boardId"));
String title = request.getParameter("title");
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>回帖</title>
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
			select{
				width: 256px;
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
					<td width="8px">您尚未</td>
					<td width="6px"><a href="login.jsp">登录</a></td>
					<td width="6px"><a href="reg.jsp">注册</a></td>
					<td width="256px"></td>
				</tr>
			</table>
		</div>
		<br/>
		<div class="two">
			<table>
				<tr>
					<td>
						>> >><a href="index.jsp">论坛首页</a>
					</td>
					<td>
						&nbsp;>> >><a href="login.jsp">C#语言</a></br>
					</td>
				</tr>
			</table>
		</div>
		<br/>
		<form name="postForm" onsubmit="return check()" action="manage/doReply.jsp" method="POST">
			<div>
				<input type="hidden" name="topicId" value="<%=topicId %>">
				<input type="hidden" name="boardId" value="<%=boardId %>">
				<input type="hidden" name="title" value="<%=title %>">
				<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="none">
					<tr bgcolor="#FF8C00" height="8px" class="one">
						<td width="20%">发表帖子</td>
						<td width="80%"></td>
					</tr>
					<tr height="8px">
						<td align="right" class="bz">选择回复人</td>
						<td align="center">
							<select>
								<option>请选择</option>
								<option>老李</option>
								<option>老张</option>
								<option>老王</option>
								<option>老徐</option>
								<option>老子</option>
								<option>Gean</option>
								<option>简逸</option>
								<option>喻言</option>
							</select>
						</td>
					</tr>
					<tr height="1px">
						<td align="right" rowspan="3" class="bz">内容</td>
						<td rowspan="2" align="center"><input name = "content" ></td>
					</tr>
					<tr height="64px">
						<td></td>
					</tr>
					<tr>
						<td class="zy" align="center">（不能超过1000字）</td>
						<td></td>
					</tr>
				</table>
			</div>
			<center>
				<table>
					<tr>
						<td class="an"><input type="submit" name="submit" value="回复"></td>
						<td class="an"><button><a href="reply.jsp">重写</a></button></td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>

