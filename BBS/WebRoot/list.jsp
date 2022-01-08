<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	ITopicDao topicDao = new TopicDaoImpl();                          //得到主题Dao的实例
	IReplyDao replyDao = new ReplyDaoImpl();                          //得到回复Dao的实例
	IUserDao userDao = new UserDaoImpl();                             //得到用户Dao的实例
	IBoardDao boardDao = new BoardDaoImpl();                          //得到版块Dao的实例
	
	
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	int p = Integer.parseInt(request.getParameter("page"));                                                       //页数暂固定为1
	List listTopic = topicDao.findListTopic(p,boardId);              //取得该版块主题列表
	Board board = boardDao.findBoard(boardId);
	int prep = p;
	int nextp = p;
	if(listTopic.size() == 20){
		nextp = p+1;
	}
	if(p>1){
		prep = p-1;
	}
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>帖子列表</title>
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
			img{
				max-width: 100%;
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
		<!-- 用户信息、登录、注册 -->
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
		<!-- 主体 -->
		<div class="two">
		<!-- 导航 -->
			<!-- &gt; : > -->
			&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
			<B><a href="list.jsp">JSP技术</a></B>
		</div>
		<!-- 发表新帖 -->
		<br/>
		<div class="three">
			<button><a href="post.jsp?boardId=<%=boardId %>">发表话题</a></button>
		</div>
		<br/>
		<!-- 翻页 -->
		<div class="on">
				<table>
					<tr>
						<td align="left">
							<a href="index.jsp?page=<%=prep %>&boardId=<%=boardId%>">上一页</a>&nbsp;&nbsp;&nbsp;
						</td>
						<td align="left">
							<a href="reg.jsp?page=<%=nextp %>&boardId=<%=boardId%>">下一页</a>
						</td>
					</tr>
				</table>
		</div>
		<div class="four">
			<table width="100%" border="1" bordercolor="lightblue" cellpadding="0" cellspacing="0">
				<tr bgcolor="blanchedalmond">
					<th colspan="4" width="100%">&nbsp;</td>
				</tr>
				<tr height="128px">
					<th width="5%"></th>
					<!-- 表头 -->
					<th align="center" width="65%">文章</th>
					<th align="center" width="15%">作者</th>
					<th align="center" width="15%">回复</th>
				</tr>
				<!-- 主题列表 -->
				<% 
					for(int i = 0;i<listTopic.size();i++) {
						Topic topic = (Topic)listTopic.get(i);          //循环取得主题对象
						User user = userDao.findUser(topic.getUserId());//取得该主题的发布用户
				%>
				<tr height="128px">
					<td width="5%" background="img/1.png"></td>
					<td align="center" width="65%">
						<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId%>&topicId=<%=topic.getTopicId() %>">
							<%= topic.getTitle() %>
						</a>		
					</td>
					<td align="center" width="15%">
						<%= user.getUserName() %>
					</td>
					<td align="center" width="15%">
						<%= replyDao.findCountReply(topic.getTopicId()) %>
					</td>
				</tr>
				<% 	}  %>
			</table>
		</div>
		
		<!-- 翻页 -->
		<div class="two">
			<center>
				<table>
					<tr>
						<td align="center">
							<a href="list.jsp?page=<%=prep %>&boardId=<%=boardId%>">上一页</a>&nbsp;&nbsp;&nbsp;
						</td>
						<td align="center">
							<a href="list.jsp?page=<%=nextp %>&boardId=<%=boardId%>">下一页</a>
						</td>
					</tr>
				</table>
			</center>
		</div>
		<!--  声明  -->
	</body>
</html>

