<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	ITopicDao topicDao = new TopicDaoImpl();                        //得到主题Dao的实例
	IReplyDao replyDao = new ReplyDaoImpl();                        //得到回复Dao的实例
	IUserDao userDao = new UserDaoImpl();                           //得到用户Dao的实例
	IBoardDao boardDao =new BoardDaoImpl();                         //得到版块Dao的实例
	int boardId = Integer.parseInt(request.getParameter("boardId"));//得到版块ID
	int topicId = Integer.parseInt(request.getParameter("topicId"));//得到主题ID
	int p = Integer.parseInt(request.getParameter("page"));         //取得页码
	Board board = boardDao.findBoard(boardId);                      //取得版块信息
	Topic topic = topicDao.findTopic(topicId);                      //取得主题信息
	User topicUser = userDao.findUser(topic.getUserId());           //取得主题作者
	List listReply = replyDao.findListReply(p,topicId);             //取得该主题的回复列表
	
	int prep = p;                                                  //上一页
	int nextp = p;                                                  //下一页
	if(listReply.size() == 20){
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
		<title>帖子</title>
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
		
		<!--      用户信息、登录、注册      -->		
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
		
		<!--              导航              -->		
		<div class="two">
				<!-- &gt; : > -->
				&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
				<B><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></B>
		</div>
		
		<!--     回复、发表     -->		
		<div class="three">
			<button><a href="reply.jsp?boardId=<%=boardId %>&topicId=<%=topicId %>&title=<%=topic.getTitle() %>">回复帖子</a></button>&nbsp;&nbsp;
			<button><a href="post.jsp?boardId=<%=boardId %>">发表话题</a></button>
		</div>
		<br/>
		
		<!--     翻页     -->		
		<div class="on">
				<table>
					<tr>
						<td align="left">
							<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId%>&topicId=<%=topicId %>">上一页</a>&nbsp;&nbsp;&nbsp;
						</td>
						<td align="left">
							<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId%>&topicId=<%=topicId %>">下一页</a>
						</td>
					</tr>
				</table>
		</div>
		
		<!--     本页主题的标题     -->
		<div class="one">
			<table width="100%" cellpadding="0" cellspacing="0" frame="void" rules="all">
				<tr bgcolor="#FF8C00">
					<td>本页主题：<%=topic.getTitle() %></td>
				</tr>
			</table>
		</div>
		
		<!--     主题    -->
		<form>
			<%
			if(p==1){
			%>
			<div class="four">
				<table width="100%" border="1" bordercolor="lightblue" cellpadding="0" cellspacing="0" rules="none">
					<tr>
						<th width="24%" align="center">
							<b><%=topicUser.getUserName() %></b><br/>
							<img src = "img/<%=topicUser.getHead() %>" width="55" height="65"/><br/>
							注册：<%=topicUser.getRegTime()  %><br/>
						</th>
						<th>
							<H4 align="left"><%=topic.getTitle() %></H4>
							<div>
								<div align="left"><%=topic.getContent() %></div>
							</div>
							<div>
								<div align="left">
									发表：[<%=topic.getPublishTime() %>]&nbsp;最后修改：[<%=topic.getModifyTime() %>]
								</div>
							</div>
						</th>
					</tr>
				</table>
			</div>
			
			<!--    回复        -->
			<%
			}
			
			for(int i=0;i<listReply.size();i++) {
					Reply reply = (Reply)listReply.get(i);                             //循环取得回复信息
					User replyUser = (User)userDao.findUser(reply.getUserId());        //取得回复的作者
			%>
			<div class="four">
				<table width="100%" border="1" bordercolor="lightblue" cellpadding="0" cellspacing="0" rules="none">
					<tr>
						<th width="24%" align="center">
							<b><%=replyUser.getUserName() %></b><br/>
							<img src = "img/<%=replyUser.getHead() %>" width="55" height="65"/><br/>
							注册：<%=topicUser.getRegTime()  %><br/>
						</th>
						<th>
							<H4 align="left"><%=reply.getTitle() %></H4>
							<div>
								<div align="left"><%=reply.getContent() %></div>
							</div>
							<div>
								<div align="left">
									发表：[<%=reply.getPublishTime() %>]&nbsp;最后修改：[<%=topic.getModifyTime() %>]
									<a href="">[删除]</a>
									<a href="">[修改]</a>
								</div>
							</div>
						</th>
					</tr>
				</table>
			</div>
			<% } %>
			<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId%>&topicId=<%=topicId %>">上一页</a>|<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId%>&topicId=<%=topicId %>">下一页</a><br>
		</form>	
		<!--     声明      -->
	</body>
</html>
