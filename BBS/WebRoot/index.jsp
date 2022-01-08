<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	IBoardDao boardDao = new BoardDaoImpl();
	Map mapBoard = boardDao.findBoard();
	ITopicDao topicDao = new TopicDaoImpl();
	IUserDao userDao = new UserDaoImpl();
%>

<!DOCTYPE html PUBLIC " - //W3C//DTD XHTML 1.0 Transitional//EN" "http:www.w3.org/TR/xhtmll/DTD/xhtmll - transitional.dtd">
<htmlxmlns = "http://www.w3.org/1999/xhtml">
	<head>
		<title>my论坛</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			h1{
				text-align: center;
				position: absolute;   /*绝对位移*/
				left:50%;
				color: darkorange;
			}
			img{
				position: absolute;   /*绝对位移*/
			    left:50%;
			    margin-left: -181px;
				}
			table{
				border-collapse: collapse;
			}
			table th{
				font-family: 华文行楷;
				font-size: 32px;
			}
			table td,th{
				border: 1px solid lightblue;
			}
			table{
				background-color: #FFFFFF ;
			}
		</style>
	</head>
	<body>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		<div width="100%" height="1024px">&nbsp;</div>
		<div class="one">
			<!--cellspacing:内容与单元格边界之间的距离，cellspacing：控制表格中单个单元格之间的距离-->
			<!--frame:控制表格最外围的四条边框的可见性，rules控制表格内部边框的可见性-->
			<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all" >
				<tr bgcolor="#FF8C00">
					<%
						if(session.getAttribute("user")==null){
					%>
					<td align="center" width="8px">您尚未</td>
					<td align="center" width="6px"><a href="login.jsp" target="_blank">登录</a></td>
					<td align="center" width="6px"><a href="reg.jsp" target="_blank">注册</a></td>
					<%
						}else{
							User loginUser = (User)session.getAttribute("user");
					%>
					 	您好：<%=loginUser.getUserName() %>|<a href="doLogout.jsp">注销</a>
					<%
					 	}
					%>
					<td width="256px"></td>
				</tr>
			</table>
		</div>
		<div id="apDiv1">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<th colspan="2" align="left">论坛</th>
					<th width="64px" align="center">主题</th>
					<th width="1024px" colspan="4" align="center">最后发表</th>
				</tr>
				<!--主版块 ，循环区的主板块-->
				<%
					List listMainBoard = (List)mapBoard.get(0);
					for(int i=0;i<listMainBoard.size();i++){
						Board mainBoard = ((Board)listMainBoard.get(i));    //循环得主版块
				%>
					<tr class="tr3">
						<td colspan="4"><%= mainBoard.getBoardName() %></td>
					</tr>
					<!--子版块-->
					<% List listSonBoard = (List)mapBoard.get(new Integer(mainBoard.getBoardId()));
						for(int j=0;j<listSonBoard.size();j++){
							Board sonBoard = (Board)listSonBoard.get(j);
							Topic topic = new Topic();
							User user = new User();
							int boardId = sonBoard.getBoardId();
							List listTopic = topicDao.findListTopic(1,boardId);
							
							if(listTopic != null && listTopic.size()>0){
								topic = (Topic)listTopic.get(0);
								user = userDao.findUser(topic.getUserId());
							}
					%>
					<TR class="tr3">
						<TD width = "5%">&nbsp;</TD>
						<TH align="left">
							<img src="img/board1.gif" width="95" height="55">
							<A href="list.jsp?page=1&boardId=<%=sonBoard.getBoardId() %>"><%=sonBoard.getBoardName() %></A>
						</TH>
						<TD align="center"><%=topicDao.findCountTopic(sonBoard.getBoardId()) %></TD>
						<TH>
							<SPAN>
								<A href="detail.jsp"><%=topic.getTitle() %></A>
							</SPAN>
							<BR/>
							<SPAN><%= user.getUserName() %></SPAN>
							<SPAN class="gray">[<%= topic.getPublishTime() %>]</SPAN>
						</TH>
					</TR>
						<!-- 子版块结束 -->
						<% } %>
					<!-- 主版块结束 -->
					<%
					}
					%>
			</table>
		</div>
	</body>
</html>
