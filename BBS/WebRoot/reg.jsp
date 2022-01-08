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
		<title>注册界面</title>
		<!--<meta http-equiv="refresh" content="5;http://fishc.taobao.com">-->
		<link rel="icon" type="image/x-icon" href="img/图标.jpg">
		<body style="background: url(img/背景2.png);"></body>
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
		<h1 align="center">用户注册</h1>
		<!--表单-->
		<form name="regForm" method="post" action="check/ckreg.jsp">
			<center>
				<table border="0">
				
					<!-- 用户名 -->
					<tr>
						<td align="right">用户名：</td>
						<td align="left"><input type="text" name="username"/></td>
					</tr>
					
					<!-- 密码 -->
					<tr>
						<td align="right">密&nbsp;&nbsp;&nbsp;码：</td>
						<td align="left"><input type="password" name="password"/></td>
					</tr>
					
					<!-- 邮箱 -->
					<tr>
						<td align="right">邮&nbsp;&nbsp;&nbsp;箱：</td>
						<td align="left"><input type="text" name="mailbox"/></td>
					</tr>
					
					<!-- 手机号 -->
					<tr>
						<td align="right">手机号：</td>
						<td align="left"><input type="text" name="tel"/></td>
					</tr>
					
					<!-- 性别 -->
					<tr>
						<td align="right">性别：</td>
						<td align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1"/>女
						</td>
					</tr>
					
					<!-- 爱好 -->
					<tr>
						<!--单选：radio-->
						<td align="right">爱好：</td>
						<td align="center">
							<input type="checkbox" name="hobby" value="看书" />看书
							<input type="checkbox" name="hobby" value="唱歌" />唱歌
							<input type="checkbox" name="hobby" value="跳舞" />跳舞
							<input type="checkbox" name="hobby" value="游戏" checked="checked" />游戏
						</td>
					</tr>
					
					<!-- 城市 -->
					<tr>
						<!--复选框：option-->
						<td align="right">城市：</td>
						<td>
							<select name="city">
								<option>请选择</option>
								<option value="北京">北京</option>
								<option value="上海">上海</option>
								<option value="天津">天津</option>
								<option value="深圳">深圳</option>
								<option value="江苏">江苏</option>
								<option value="浙江">浙江</option>
							</select>
						</td>
					</tr>
					
					<!-- 自我介绍 -->
					<tr>
						<!--多行文本-->
						<td align="right">自我介绍：</td>
						<td width="50%"><textarea style="resize: none;" rowspan="10" colspan="10" name="self"></textarea></td>
					</tr>
					<tr>
						<td align="right">注意：</td>
						<td width="50%">100字以内</td>
					</tr>
					
					<!-- 头像 -->
					<tr>
						<td align="right">头像：</td>
						<td align="left">
							<input type="radio" name="head" value="1.png"><img alt="1" src="img/1.png" width="50px" heigth="100px">
							<input type="radio" name="head" value="2.png"><img alt="2" src="img/2.png" width="50px" heigth="100px">
							<input type="radio" name="head" value="3.png"><img alt="3" src="img/3.png" width="50px" heigth="100px">
							<input type="radio" name="head" value="4.png"><img alt="4" src="img/4.png" width="50px" heigth="100px">
						</td>
					</tr>
					<tr>
						<td align="right">
							<input type="submit" name="submit" value="注册" />&nbsp;&nbsp;
							<input type="reset" name="reset" value="取消" />
						</td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>
